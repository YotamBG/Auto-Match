import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class sign_up_process_2 extends StatefulWidget {
  @override
  State<sign_up_process_2> createState() => _sign_up_process_2State();
}

class _sign_up_process_2State extends State<sign_up_process_2> {
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
        // signupprocess2UPT (17:51)
        padding: EdgeInsets.fromLTRB(31 * fem, 175 * fem, 24 * fem, 70 * fem),
        width: double.infinity,
        height: 812 * fem,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Container(
          // signupPmK (17:52)
          padding:
              EdgeInsets.fromLTRB(21 * fem, 18.33 * fem, 41 * fem, 20 * fem),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // backarrowJ7b (17:71)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 27.33 * fem),
                width: 24 * fem,
                height: 18.33 * fem,
                child: Image.asset(
                  'assets/page-1/images/back-arrow-ZqT.png',
                  width: 24 * fem,
                  height: 18.33 * fem,
                ),
              ),
              Container(
                // signupoq3 (17:54)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 60 * fem),
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
                // phonenumberVSy (17:67)
                margin:
                    EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 61 * fem),
                width: 255 * fem,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff000000)),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        11 * fem, 11 * fem, 11 * fem, 12 * fem),
                    hintText: 'Phone number',
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
                // dateofbirthxE5 (17:58)
                margin:
                    EdgeInsets.fromLTRB(30 * fem, 0 * fem, 27 * fem, 121 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupxvburaM (Nr6dmc4FyPMVZ2QqxQxVbu)
                      padding: EdgeInsets.fromLTRB(
                          14 * fem, 0 * fem, 13 * fem, 10 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // dateofbirthmqj (17:83)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1.38 * fem, 12 * fem),
                            child: Text(
                              'Date of birth',
                              textAlign: TextAlign.center,
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
                            // autogroup7sax55j (Nr6dUnCxeh5bhdTwUW7saX)
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // dayR9b (17:81)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 41 * fem, 0 * fem),
                                  child: Text(
                                    'Day',
                                    textAlign: TextAlign.center,
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
                                  // monthWwj (17:82)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 39 * fem, 0 * fem),
                                  child: Text(
                                    'Month',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Playfair Display',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3325 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Text(
                                  // yeardWZ (17:60)
                                  'Year',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Playfair Display',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3325 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupwbfdNU9 (Nr6dcSerkugQHcRxQZWbFd)
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // dayboxhFX (17:59)
                            width: 53 * fem,
                            height: 38 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff000000)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 21 * fem,
                          ),
                          Container(
                            // monthboxzkR (17:84)
                            width: 53 * fem,
                            height: 38 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff000000)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 21 * fem,
                          ),
                          Container(
                            // yearboxtqo (17:85)
                            width: 53 * fem,
                            height: 38 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff000000)),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // continuebutton19j (154:12)
                margin:
                    EdgeInsets.fromLTRB(32 * fem, 0 * fem, 20 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup3');
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
                          color: Color(0x3f000000),
                          offset: Offset(7 * fem, 7 * fem),
                          blurRadius: 2 * fem,
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
      ),
    )));
  }
}
