import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';

class Sign_up_music extends StatefulWidget {
  const Sign_up_music({super.key});

  @override
  State<Sign_up_music> createState() => _Sign_up_musicState();
}

class _Sign_up_musicState extends State<Sign_up_music> {
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
      "music": playlistURL,
    };
    print('jsonData:');
    print(jsonData);

    try {
      final musicReq = await api.dio.post(
        '${dotenv.env["SERVER_URL"]}/submit-music',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(jsonData),
      );

      final musicReqResponse = musicReq.data.toString();
      print('Server Response: $musicReqResponse');
    } catch (e) {
      print(e);
    }
    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    Navigator.pushNamed(context, '/sign_up_filters');
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
        padding: EdgeInsets.fromLTRB(31 * fem, 36 * fem, 24 * fem, 72 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 13 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-Kiy.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  21 * fem, 20.33 * fem, 33 * fem, 28 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
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
                        color: const Color(0xff1f4095),
                      ),
                    ),
                  ),
                  Container(
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
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        11 * fem, 0 * fem, 0 * fem, 90 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
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
                        hintStyle: const TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
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
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        39 * fem, 0 * fem, 21 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_up_filters');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 38 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xffe7674a),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000),
                              offset: Offset(7 * fem, 7 * fem),
                              blurRadius: 1 * fem,
                            ),
                          ],
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign_up_filters');
                            },
                            child: Text(
                              'SKIP',
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
