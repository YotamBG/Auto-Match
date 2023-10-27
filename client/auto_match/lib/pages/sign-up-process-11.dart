import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/services/api.dart';
import 'package:myapp/utils.dart';

class sign_up_process_11 extends StatefulWidget {
  @override
  State<sign_up_process_11> createState() => _sign_up_process_11State();
}

class _sign_up_process_11State extends State<sign_up_process_11> {
  List<dynamic> selectedImageIds = []; // Stores the IDs of selected images
  List<Map<String, dynamic>> imagesList = [];
  // final TextEditingController _playlistController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch image data from the backend API
    fetchImageData();
  }

  Future<void> fetchImageData() async {
    final url = 'http://10.0.2.2:5000';
    final response = await http.get(Uri.parse('$url/pics/catalog/30'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        imagesList = (jsonData['images'] as List<dynamic>)
            .asMap()
            .entries
            .map((entry) => {
                  'image_url': '$url/pic/catalog/${entry.value}',
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
    // Create a list of nopedFaces by filtering the imagesList
    final nopedFaces = imagesList
        .where((face) => !selectedImageIds.contains(face['id']))
        .take(selectedImageIds.length)
        .map((face) => face['id'])
        .toList();

    print(nopedFaces);
    final jsonData = {
      "likedFaces": selectedImageIds,
      "nopedFaces": nopedFaces
    }; // popuate nopedFaces with faces that weren't selected

    final trainFaceResponse = await api.dio.post(
      'http://10.0.2.2:5000/submitFaces',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    final trainFaceReqResponse = trainFaceResponse.data.toString();
    print('Server Response: ${trainFaceReqResponse}');
    Navigator.of(context).pop();

    Navigator.pushNamed(context, '/matches');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // signupprocess11zky (120:44)
        padding: EdgeInsets.fromLTRB(30 * fem, 50 * fem, 42 * fem, 55 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logotrM (140:143)
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
              // backarrowpV7 (120:49)
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
            GridView.count(
              physics: ScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              crossAxisCount: 3, // Number of columns in the grid
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
                            // width: double.infinity,
                            // height: double.infinity,
                            child: Image.network(
                              face['image_url'],
                              fit: BoxFit
                                  .contain, // You can adjust the fit as needed
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
                        // Display the image
                        Image.network(
                          face['image_url'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        // Show a checkmark icon if selected
                        if (isSelected)
                          Positioned(
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
              // autogroupsdwxBpm (Nr6iSDnLxJCQGNdNMEsDWX)
              margin: EdgeInsets.fromLTRB(49 * fem, 0 * fem, 48 * fem, 0 * fem),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup12');
                  // sendDataToServer();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: double.infinity,
                  height: 38 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffdee5ed),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff000000),
                        offset: Offset(7 * fem, 7 * fem),
                        blurRadius: 1 * fem,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'CONTINUE',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
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
