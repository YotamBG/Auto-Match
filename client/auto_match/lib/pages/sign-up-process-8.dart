import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/services/api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:myapp/utils.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class sign_up_process_8 extends StatefulWidget {
  @override
  State<sign_up_process_8> createState() => _sign_up_process_8State();
}

class _sign_up_process_8State extends State<sign_up_process_8> {
  // final TextEditingController _playlistController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile; // Variable to store the selected image file

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();
    print('statuses:');
    print(statuses);
    print('pick image!');
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<void> submitFace() async {
    // Show loading dialog
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

    try {
      if (_imageFile != null) {
        // Get the image file path
        final String imagePath = _imageFile!.path;

        // Send the image file to the server using Dio
        final FormData formData = FormData.fromMap({
          "face": await MultipartFile.fromFile(
            imagePath,
            filename: 'face_image.jpg',
          ),
        });

        print('Sending req to server...');

        final Response response = await api.dio.post(
          'http://10.0.2.2:5000/submitFace',
          data: formData,
        );

        final signInReqResponse = response.data.toString();
        print('Server Response: ${signInReqResponse}');
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error: $e');
    }

    // Hide loading dialog
    Navigator.of(context).pop();

    // Move to the next screen
    Navigator.pushNamed(context, '/signup9');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      child: Container(
        // signupprocess884h (114:185)
        padding: EdgeInsets.fromLTRB(31 * fem, 37 * fem, 24 * fem, 72 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logoS5P (140:140)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 12 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-CvM.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // signupm7f (114:186)
              padding: EdgeInsets.fromLTRB(
                  20.5 * fem, 20.33 * fem, 12.5 * fem, 32 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // backarrow46m (114:201)
                    margin: EdgeInsets.fromLTRB(
                        0.5 * fem, 0 * fem, 0 * fem, 25.33 * fem),
                    width: 24 * fem,
                    height: 18.33 * fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-iKs.png',
                      width: 24 * fem,
                      height: 18.33 * fem,
                    ),
                  ),
                  Container(
                    // signupmWy (114:188)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 5 * fem),
                    width: double.infinity,
                    child: Text(
                      'SIGN UP',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // photo51s (114:189)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 103 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // explanationparagraphoCm (114:196)
                          constraints: BoxConstraints(
                            maxWidth: 287 * fem,
                          ),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: SafeGoogleFont(
                                'Playfair Display',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.3325 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: 'We need your photo!\n',
                                ),
                                TextSpan(
                                  text:
                                      'AUTOMATCH is using user face to determine your taste and match you with the right people for you',
                                  style: SafeGoogleFont(
                                    'Playfair Display',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3325 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('tap!');
                            _pickImage();
                          },
                          child: Container(
                            // autogroupzq6f6bB (Nr6hmKjVRztcBaBWE8zq6f)
                            padding: EdgeInsets.fromLTRB(
                                100.5 * fem, 36 * fem, 109.5 * fem, 0 * fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupn5tbWeu (Nr6hgADRqYkHPyaGzQN5tB)
                                  padding: EdgeInsets.fromLTRB(10 * fem,
                                      6 * fem, 14.63 * fem, 4.63 * fem),
                                  width: double.infinity,
                                  height: 63 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xffd9d9d9),
                                  ),
                                  child: Container(
                                    // cameraiconqSH (120:121)
                                    padding: EdgeInsets.fromLTRB(4.36 * fem,
                                        6.55 * fem, 4.36 * fem, 6.55 * fem),
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x00ffffff),
                                    ),
                                    child: Center(
                                      // group9hs (120:118)
                                      child: SizedBox(
                                        width: 43.64 * fem,
                                        height: 39.27 * fem,
                                        child: Image.asset(
                                          'assets/page-1/images/group-54D.png',
                                          width: 43.64 * fem,
                                          height: 39.27 * fem,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        _imageFile != null
                            ? Image.file(
                                File(_imageFile!.path),
                                width: 100,
                                height: 100,
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupydfvfRK (Nr6hSv6Viavk4LGuCtYdFV)
                    margin: EdgeInsets.fromLTRB(
                        33.5 * fem, 0 * fem, 47.5 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        submitFace();
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
          ],
        ),
      ),
    )));
  }
}
