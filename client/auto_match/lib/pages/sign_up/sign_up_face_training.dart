import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    print('page!! ${pageNum}');

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
    loading(context);

    print('Sending req to server...');
    print(selectedImageIds);

    final dislikedFaces = imagesList
        .where((face) => !selectedImageIds.contains(face['id']))
        .take(selectedImageIds.length)
        .map((face) => face['id'])
        .toList();

    print(dislikedFaces);
    final jsonData = {
      "likedFaces": selectedImageIds,
      "dislikedFaces": dislikedFaces
    };

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
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          // signup6PuX (405:275)
          padding: EdgeInsets.fromLTRB(13 * fem, 33 * fem, 12 * fem, 26 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupzfqdgtd (TtqQf4JJjPyVQqqSXazFqd)
                margin:
                    EdgeInsets.fromLTRB(13 * fem, 0 * fem, 67 * fem, 16 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // logoZxR (405:283)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 18 * fem, 1 * fem),
                      width: 51 * fem,
                      height: 50 * fem,
                      child: Image.asset(
                        'assets/page-1/images/logo-JpD.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      // definetasteaMj (405:281)
                      'Define taste',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 35 * ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.26 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // text6qs (405:282)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 53 * fem),
                child: Text(
                  'Select faces you like',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 24 * ffem,
                    fontWeight: FontWeight.w300,
                    height: 1.26 * ffem / fem,
                    color: Color(0xff2c2c2c),
                  ),
                ),
              ),
              (imagesList.isEmpty
                  ? SpinKitCubeGrid(
                      color: Color(0xff2c2c2c),
                      size: 60.0,
                    )
                  : SizedBox()),
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
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              border: Border.all(
                                color: isSelected
                                    ? Color.fromARGB(255, 44, 44, 44)
                                    : Colors.white,
                                width: 2.5, // Adjust the border width as needed
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Use the same radius as in BoxDecoration
                              child: Image.network(
                                face['image_url'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              Container(
                // signinbutton87f (405:276)
                margin:
                    EdgeInsets.fromLTRB(28 * fem, 0 * fem, 32 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    sendDataToServer();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 71 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff2c2c2c),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Center(
                      child: Text(
                        pageNum == lastPageNum ? 'Finish Training' : 'Continue',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Plus Jakarta Sans',
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.26 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
