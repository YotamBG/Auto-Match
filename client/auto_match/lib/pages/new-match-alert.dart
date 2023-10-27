import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class new_match_alert extends StatefulWidget {
  @override
  State<new_match_alert> createState() => _new_match_alertState();
}

class _new_match_alertState extends State<new_match_alert> {
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
        // newmatchalertC4y (120:69)
        padding:
            EdgeInsets.fromLTRB(34.5 * fem, 310 * fem, 33.5 * fem, 25.63 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // paragraph7Bw (120:122)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 316 * fem),
              constraints: BoxConstraints(
                maxWidth: 307 * fem,
              ),
              child: Text(
                'We have a match for you!',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Playfair Display',
                  fontSize: 40 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.3325 * ffem / fem,
                  color: Color(0xff1f4095),
                ),
              ),
            ),
            Container(
              // iconbarQRw (120:125)
              margin: EdgeInsets.fromLTRB(
                  11.5 * fem, 0 * fem, 16.13 * fem, 0 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // iconmessagecircleoutlinewAy (120:103)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 1 * fem, 65.63 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 52.37 * fem,
                        height: 52.37 * fem,
                        child: Image.asset(
                          'assets/page-1/images/icon-message-circle-outline.png',
                          width: 52.37 * fem,
                          height: 52.37 * fem,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // iconheartQ4Z (120:89)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 56.63 * fem, 1 * fem),
                    padding: EdgeInsets.fromLTRB(
                        4.36 * fem, 8.73 * fem, 4.36 * fem, 6.55 * fem),
                    decoration: BoxDecoration(
                      color: Color(0x00ffffff),
                    ),
                    child: Center(
                      // vectorWNV (120:88)
                      child: SizedBox(
                        width: 43.64 * fem,
                        height: 37.09 * fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/vector.png',
                            width: 43.64 * fem,
                            height: 37.09 * fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // iconpersonDnh (120:95)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1 * fem),
                    padding: EdgeInsets.fromLTRB(
                        10.91 * fem, 6.55 * fem, 10.91 * fem, 6.55 * fem),
                    decoration: BoxDecoration(
                      color: Color(0x00ffffff),
                    ),
                    child: Center(
                      // groupXoP (120:92)
                      child: SizedBox(
                        width: 30.55 * fem,
                        height: 39.27 * fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/group.png',
                            width: 30.55 * fem,
                            height: 39.27 * fem,
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
