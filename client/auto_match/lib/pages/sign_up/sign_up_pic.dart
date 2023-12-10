import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';


import 'package:dio/dio.dart';

class Sign_up_pic extends StatefulWidget {
  const Sign_up_pic({super.key});

  @override
  State<Sign_up_pic> createState() => _Sign_up_picState();
}

class _Sign_up_picState extends State<Sign_up_pic> {
  final ImagePicker picker = ImagePicker();
  XFile? imageFile;

  Future<void> pickImage() async {
    final statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();

    print('statuses:');
    print(statuses);
    print('pick image!');

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      await cropImage(image.path);
    }
    // setState(() {
    //   imageFile = image;
    // });
  }
  Future<void> cropImage(String imagePath) async {
  CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imagePath,
      maxWidth: null,
      maxHeight: null,
      aspectRatio: null,
      aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ],
      cropStyle: CropStyle.rectangle,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 90,
      uiSettings: null,
    );

  if (croppedFile != null) {
    setState(() {
      imageFile = XFile(croppedFile.path);
    });
  }
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
      if (imageFile != null) {
        // Get the image file path
        final String imagePath = imageFile!.path;

        // Send the image file to the server using Dio
        final FormData formData = FormData.fromMap({
          "face": await MultipartFile.fromFile(
            imagePath,
            filename: 'face_image.jpg',
          ),
        });

        print('Sending req to server...');

        final Response response = await api.dio.post(
          '${dotenv.env["SERVER_URL"]}/submit-face',
          data: formData,
        );

        final signInReqResponse = response.data.toString();
        print('Server Response: $signInReqResponse');
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error: $e');
    }

    // Hide loading dialog
    Navigator.of(context).pop();

    // Move to the next screen
    Navigator.pushNamed(context, '/sign_up_memo');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
            child: SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(31 * fem, 37 * fem, 24 * fem, 72 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 12 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-CvM.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  20.5 * fem, 20.33 * fem, 12.5 * fem, 32 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 103 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
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
                                color: const Color(0xff000000),
                              ),
                              children: [
                                const TextSpan(
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
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('tap!');
                            pickImage();
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                100.5 * fem, 36 * fem, 109.5 * fem, 0 * fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10 * fem,
                                      6 * fem, 14.63 * fem, 4.63 * fem),
                                  width: double.infinity,
                                  height: 63 * fem,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffd9d9d9),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(4.36 * fem,
                                        6.55 * fem, 4.36 * fem, 6.55 * fem),
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color(0x00ffffff),
                                    ),
                                    child: Center(
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
                        imageFile != null
                            ? Image.file(
                                File(imageFile!.path),
                                width: 100,
                                height: 100,
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Container(
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
                            'CONTINUE',
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
          ],
        ),
      ),
    )));
  }
}
