import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/services/api.dart';
import 'package:myapp/utils.dart';

class sign_up_process_6 extends StatefulWidget {
  @override
  State<sign_up_process_6> createState() => _sign_up_process_6State();
}

class _sign_up_process_6State extends State<sign_up_process_6> {
  final TextEditingController _playlistController = TextEditingController();

  Future<void> submitMusic() async {
    //show loading
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

    final String playlistURL = _playlistController.text;
    print(playlistURL);

    // send req to server
    print('Sending req to server...');
    final jsonData = {
      "music": playlistURL, // Send the array of songs to the server
    };
    print('jsonData:');
    print(jsonData);

    try {
      final musicReq = await api.dio.post(
        'http://10.0.2.2:5000/submitMusic',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(jsonData),
      );

      final musicReqResponse = musicReq.data.toString();
      print('Server Response: ${musicReqResponse}');
    } catch (e) {
      print(e);
    }
    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    Navigator.pushNamed(context, '/signup7');
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
        // signupprocess6XqB (114:84)
        padding: EdgeInsets.fromLTRB(31 * fem, 36 * fem, 24 * fem, 72 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logooGu (140:138)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 13 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-Kiy.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // signupJDf (114:85)
              padding: EdgeInsets.fromLTRB(
                  21 * fem, 20.33 * fem, 33 * fem, 28 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backarrowD5j (114:92)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 242 * fem, 25.33 * fem),
                    width: 24 * fem,
                    height: 18.33 * fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-oqK.png',
                      width: 24 * fem,
                      height: 18.33 * fem,
                    ),
                  ),
                  Container(
                    // signupvF3 (114:87)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 114 * fem, 21 * fem),
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
                    // connectspotifyDzq (114:94)
                    margin: EdgeInsets.fromLTRB(
                        12 * fem, 0 * fem, 0 * fem, 17 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 193 * fem,
                    ),
                    child: Text(
                      'CONNECT YOUR SPOTIFY',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff1f4095),
                      ),
                    ),
                  ),
                  Container(
                    // explanationparagraphiwb (114:95)
                    margin: EdgeInsets.fromLTRB(
                        6 * fem, 0 * fem, 0 * fem, 50 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 219 * fem,
                    ),
                    child: Text(
                      'AUTOMATCH uses your Spotify to match you with people who has the same music taste as you',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // passwordE9F (155:62)
                    margin: EdgeInsets.fromLTRB(
                        11 * fem, 0 * fem, 0 * fem, 90 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff000000)),
                    ),
                    child: TextField(
                      controller: _playlistController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            19.48 * fem, 11 * fem, 19.48 * fem, 12 * fem),
                        hintText: 'Playlist URL',
                        hintStyle: TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupawjh48H (Nr6fgdhbF5STTMUFYiaWjH)
                    margin: EdgeInsets.fromLTRB(
                        39 * fem, 0 * fem, 21 * fem, 19 * fem),
                    child: TextButton(
                      onPressed: () {
                        submitMusic();
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
                  Container(
                    // autogroup6texZjF (Nr6fmdZGGcMR48BpwN6TeX)
                    margin: EdgeInsets.fromLTRB(
                        39 * fem, 0 * fem, 21 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup7');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 38 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffe7674a),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000),
                              offset: Offset(7 * fem, 7 * fem),
                              blurRadius: 1 * fem,
                            ),
                          ],
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup7');
                            },
                            child: Text(
                              'SKIP',
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
