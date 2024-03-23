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
    loading(context);

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
    Navigator.pushNamed(context, '/sign_up_memo',
                            arguments: {'memoNum': 6});
    // Navigator.pushNamed(context, '/sign_up_face_training',
    //     arguments: {'pageNum': 1, 'lastPageNum': 3});
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: SizedBox(
        width: double.infinity,
        child: Container(
          // signup535f (405:252)
          padding: EdgeInsets.fromLTRB(26 * fem, 33 * fem, 43 * fem, 173 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroup1g8kjjB (TtqQJV4Fe41srsMMWC1g8K)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 9 * fem, 80 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // logoGj7 (405:264)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 9 * fem, 1 * fem),
                      width: 51 * fem,
                      height: 50 * fem,
                      child: Image.asset(
                        'assets/page-1/images/logo-Sfw.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      // importpictureCMs (405:262)
                      'Import Picture',
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
                // textKSV (405:263)
                margin:
                    EdgeInsets.fromLTRB(14 * fem, 0 * fem, 0 * fem, 85 * fem),
                child: Text(
                  'Select a profile picture',
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
              Container(
                // emailinputdTB (405:259)
                margin:
                    EdgeInsets.fromLTRB(62 * fem, 0 * fem, 44 * fem, 58 * fem),
                child: TextButton(
                  onPressed: () {
                    pickImage();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        53 * fem, 55 * fem, 56.18 * fem, 54.18 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xfff4f3f3),
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                    child: Center(
                      // imageiconufb (405:270)
                      child: SizedBox(
                        width: 90.82 * fem,
                        height: 90.82 * fem,
                        child: Image.asset(
                          'assets/page-1/images/image-icon.png',
                          width: 90.82 * fem,
                          height: 90.82 * fem,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              imageFile != null
                  ? Image.file(
                      File(imageFile!.path),
                      width: 150,
                      height: 150,
                    )
                  : const SizedBox(),
              SizedBox(height: 40),
              Container(
                // signinbuttonS9j (405:253)
                margin:
                    EdgeInsets.fromLTRB(16 * fem, 0 * fem, 0 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    submitFace();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 290 * fem,
                    height: 71 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff2c2c2c),
                      borderRadius: BorderRadius.circular(20 * fem),
                    ),
                    child: Center(
                      child: Text(
                        'Continue ',
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
              // Container(
              //   // signinbuttonPem (405:177)
              //   margin:
              //       EdgeInsets.fromLTRB(15 * fem, 0 * fem, 7.5 * fem, 0 * fem),
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/sign_up_memo',
              //               arguments: {'memoNum': 6});
              //     },
              //     style: TextButton.styleFrom(
              //       padding: EdgeInsets.zero,
              //     ),
              //     child: Container(
              //       width: double.infinity,
              //       height: 71 * fem,
              //       decoration: BoxDecoration(
              //         color: Color(0xffffffff),
              //         borderRadius: BorderRadius.circular(20 * fem),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Color(0x3f000000),
              //             offset: Offset(0 * fem, 4 * fem),
              //             blurRadius: 2 * fem,
              //           ),
              //         ],
              //       ),
              //       child: Center(
              //         child: Text(
              //           'Skip',
              //           textAlign: TextAlign.center,
              //           style: SafeGoogleFont(
              //             'Plus Jakarta Sans',
              //             fontSize: 24 * ffem,
              //             fontWeight: FontWeight.w500,
              //             height: 1.26 * ffem / fem,
              //             color: Color(0xff2c2c2c),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      )),
    ));
  }
}
