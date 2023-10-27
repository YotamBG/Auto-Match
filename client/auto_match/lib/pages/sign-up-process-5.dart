import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/services/api.dart';
import 'package:myapp/utils.dart';

class sign_up_process_5 extends StatefulWidget {
  @override
  State<sign_up_process_5> createState() => _sign_up_process_5State();
}

class _sign_up_process_5State extends State<sign_up_process_5> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> submitReels() async {
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

    final username = _usernameController.text;
    final password = _passwordController.text;

    // send req to server
    print('Sending req to server...');
    final jsonData = {
      "username": username,
      "password": password,
    };
    print('jsonData:');
    print(jsonData);

    try {
      final signInReq = await api.dio.post(
        'http://10.0.2.2:5000/submitReels',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(jsonData),
      );

      final signInReqResponse = signInReq.data.toString();
      print('Server Response: ${signInReqResponse}');
    } catch (e) {
      print(e);
    }
    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    Navigator.pushNamed(context, '/signup6');
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
        // signupprocess5U7b (112:44)
        padding: EdgeInsets.fromLTRB(31 * fem, 33 * fem, 24 * fem, 72 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logoyq3 (140:137)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 16 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // signupJcR (112:45)
              padding: EdgeInsets.fromLTRB(
                  21 * fem, 20.33 * fem, 36 * fem, 28 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backarrowCSu (112:63)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 239 * fem, 25.33 * fem),
                    width: 24 * fem,
                    height: 18.33 * fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-tth.png',
                      width: 24 * fem,
                      height: 18.33 * fem,
                    ),
                  ),
                  Container(
                    // signupHjF (112:47)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 111 * fem, 21 * fem),
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
                    // connectyourinstagramztZ (154:55)
                    margin: EdgeInsets.fromLTRB(
                        8 * fem, 0 * fem, 0 * fem, 23 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 193 * fem,
                    ),
                    child: Text(
                      'CONNECT YOUR INSTAGRAM',
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
                    // explanationparagraphHsf (113:77)
                    margin: EdgeInsets.fromLTRB(
                        9 * fem, 0 * fem, 0 * fem, 25 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 213 * fem,
                    ),
                    child: Text(
                      'AUTOMATCH uses your Instagram to match you with people who has the same intrests as you',
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
                    // usernamemnq (155:56)
                    margin: EdgeInsets.fromLTRB(
                        8 * fem, 0 * fem, 0 * fem, 36 * fem),
                    width: 255 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupb58bHFP (Nr6fRixmSwKGFTGMJKb58B)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 12 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff000000)),
                          ),
                          child: TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(
                                  14.48 * fem, 11 * fem, 14.48 * fem, 12 * fem),
                              hintText: 'Username',
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
                          // passwordDoF (155:59)
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff000000)),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(
                                  16.48 * fem, 11 * fem, 16.48 * fem, 12 * fem),
                              hintText: 'Password',
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
                      ],
                    ),
                  ),
                  Container(
                    // autogroupa2fhTxV (Nr6fAu48wFokdy1GyUA2fh)
                    margin: EdgeInsets.fromLTRB(
                        33 * fem, 0 * fem, 24 * fem, 19 * fem),
                    child: TextButton(
                      onPressed: () {
                        submitReels();
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
                    // autogroupmbyboey (Nr6fFK6SyaQw5r74uJmBYb)
                    margin: EdgeInsets.fromLTRB(
                        33 * fem, 0 * fem, 24 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        submitReels();
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
                              Navigator.pushNamed(context, '/signup6');
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
