import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Sign_up_face_training extends StatefulWidget {
  const Sign_up_face_training({super.key});

  @override
  State<Sign_up_face_training> createState() => _Sign_up_face_trainingState();
}

class _Sign_up_face_trainingState extends State<Sign_up_face_training> {
  List<dynamic> selectedImageIds = [];
  List<Map<String, dynamic>> imagesList = [];
  var pageNum;
  var lastPageNum;

  @override
  void initState() {
    super.initState();
    // fetchImageData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadPage();
  }

  Future<void> loadPage() async {
    final argObject = ModalRoute.of(context)!.settings.arguments as dynamic;
    final pageNumArg = argObject['pageNum'];
    final lastPageNumArg = argObject['lastPageNum'];
    setState(() {
      pageNum = pageNumArg;
      lastPageNum = lastPageNumArg;
    });

    fetchImageData();
  }

  Future<void> fetchImageData() async {
    final response = await http
        .get(Uri.parse('${dotenv.env["SERVER_URL"]}/pics/catalog/$pageNum'));
    print('page!!');

    if (response.statusCode == 200) {
      // Parse the JSON response
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        imagesList = (jsonData['images'] as List<dynamic>)
            .asMap()
            .entries
            .map((entry) => {
                  'image_url':
                      '${dotenv.env["SERVER_URL"]}/pic/catalog/${entry.value}',
                  'id': entry.value
                })
            .toList();
      });
    } else {
      // Handle error when fetching data
      print('Error fetching image data: ${response.statusCode}');
      print(response.body);
    }
  }

  void sendDataToServer() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AlertDialog(
        content: SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    print('Sending req to server...');
    print(selectedImageIds);

    final nopedFaces = imagesList
        .where((face) => !selectedImageIds.contains(face['id']))
        .take(selectedImageIds.length)
        .map((face) => face['id'])
        .toList();

    print(nopedFaces);
    final jsonData = {"likedFaces": selectedImageIds, "nopedFaces": nopedFaces};

    final submitFacesResponse = await api.dio.post(
      '${dotenv.env["SERVER_URL"]}/submit-faces',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    final submitFacesReqResponse = submitFacesResponse.data.toString();
    print('Server Response: $submitFacesReqResponse');

    if (pageNum == lastPageNum) {
      // if last
      final trainFaceResponse = await api.dio.post(
        '${dotenv.env["SERVER_URL"]}/train-face',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(jsonData),
      );
      final trainFaceReqResponse = trainFaceResponse.data.toString();
      print('Server Response: $trainFaceReqResponse');

      Navigator.of(context).pop();
      Navigator.pushNamed(context, '/matches');
    } else {
      Navigator.of(context).pop();
      Navigator.pushNamed(context, '/sign_up_face_training',
          arguments: {'pageNum': pageNum + 1, 'lastPageNum': lastPageNum});
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(30 * fem, 50 * fem, 42 * fem, 55 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  EdgeInsets.fromLTRB(13 * fem, 0 * fem, 0 * fem, 19.33 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-2x9.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 235 * fem, 10 * fem),
              width: 24 * fem,
              height: 18.33 * fem,
              child: Image.asset(
                'assets/page-1/images/back-arrow-3cD.png',
                width: 24 * fem,
                height: 18.33 * fem,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 15 * fem),
              width: double.infinity,
              child: Text(
                'Face training - step $pageNum',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Playfair Display',
                  fontSize: 30 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.3325 * ffem / fem,
                  color: const Color(0xff000000),
                ),
              ),
            ),
            GridView.count(
              physics: const ScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: imagesList.map((face) {
                final isSelected = selectedImageIds.contains(face['id']);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedImageIds.remove(face['id']);
                      } else {
                        selectedImageIds.add(face['id']);
                      }
                    });
                    print('selectedImageIds $selectedImageIds');
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            child: Image.network(
                              face['image_url'],
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: [
                        Image.network(
                          face['image_url'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        if (isSelected)
                          const Positioned(
                            top: 8,
                            right: 8,
                            child: Icon(
                              Icons.check_circle,
                              color: Color.fromARGB(207, 31, 64, 149),
                              size: 32,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(49 * fem, 0 * fem, 48 * fem, 0 * fem),
              child: TextButton(
                onPressed: () {
                  sendDataToServer();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: double.infinity,
                  height: 38 * fem,
                  decoration: BoxDecoration(
                    color: const Color(0xffdee5ed),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff000000),
                        offset: Offset(7 * fem, 7 * fem),
                        blurRadius: 1 * fem,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      pageNum == lastPageNum ? 'FINISH TRAINING' : 'CONTINUE',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
