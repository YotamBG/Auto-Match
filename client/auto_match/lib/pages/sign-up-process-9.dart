import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class sign_up_process_9 extends StatefulWidget {
  @override
  State<sign_up_process_9> createState() => _sign_up_process_9State();
}

class _sign_up_process_9State extends State<sign_up_process_9> {
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
        // signupprocess9nNm (120:10)
        padding:
            EdgeInsets.fromLTRB(43.5 * fem, 46 * fem, 48.5 * fem, 126 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logoGYq (140:141)
              margin: EdgeInsets.fromLTRB(6 * fem, 0 * fem, 0 * fem, 87 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-swP.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // signupn1P (120:11)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 166 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // donegsT (120:13)
                    margin: EdgeInsets.fromLTRB(
                        6 * fem, 0 * fem, 0 * fem, 43 * fem),
                    child: Text(
                      'DONE!',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 40 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // explanationparagraphPms (120:17)
                    constraints: BoxConstraints(
                      maxWidth: 283 * fem,
                    ),
                    child: Text(
                      'while we wait for your picture to be approved by the system, lets find out whats your taste!',
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
                ],
              ),
            ),
            Container(
              // autogroupyqksi3T (Nr6i54ivsjw1ZWXVs2yqks)
              margin:
                  EdgeInsets.fromLTRB(38.5 * fem, 0 * fem, 38.5 * fem, 0 * fem),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup10');
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
