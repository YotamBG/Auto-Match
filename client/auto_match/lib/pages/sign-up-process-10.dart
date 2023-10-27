import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class sign_up_process_10 extends StatefulWidget {
  @override
  State<sign_up_process_10> createState() => _sign_up_process_10State();
}

class _sign_up_process_10State extends State<sign_up_process_10> {
  // final TextEditingController _playlistController = TextEditingController();
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
        // signupprocess103ms (120:26)
        padding:
            EdgeInsets.fromLTRB(51.5 * fem, 44 * fem, 51.5 * fem, 125 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logox89 (140:142)
              margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 187 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-6EV.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // explanationparagraph5Tf (120:43)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 166 * fem),
              constraints: BoxConstraints(
                maxWidth: 272 * fem,
              ),
              child: Text(
                'Pick the faces you’re attracted to, to teach the system what you like and what you don’t',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Playfair Display',
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.3325 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogroupuvnkmbP (Nr6iFj5qCUgPWMXG2gUvnK)
              margin:
                  EdgeInsets.fromLTRB(33.5 * fem, 0 * fem, 32.5 * fem, 0 * fem),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup12');
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
    )));
  }
}
