import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // previewprofiler5X (167:182)
        padding: EdgeInsets.fromLTRB(15*fem, 30.33*fem, 15*fem, 6*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // backarrow8Yq (167:206)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 301*fem, 43.33*fem),
              width: 24*fem,
              height: 18.33*fem,
              child: Image.asset(
                'assets/page-1/images/back-arrow-d5K.png',
                width: 24*fem,
                height: 18.33*fem,
              ),
            ),
            Container(
              // editandpreviewe1P (167:203)
              margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 16.5*fem, 16*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // editMAh (167:204)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 144.5*fem, 0*fem),
                    child: Text(
                      'EDIT',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 24*ffem,
                        height: 1.3325*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Text(
                    // previewfBP (167:205)
                    'PREVIEW',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Playfair Display',
                      fontSize: 24*ffem,
                      height: 1.3325*ffem/fem,
                      color: Color(0xff1f4095),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // nameagezUZ (167:229)
              margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 6*fem),
              child: Text(
                'Yaara, 20',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Playfair Display',
                  fontSize: 40*ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.3325*ffem/fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // photosVw7 (167:230)
              margin: EdgeInsets.fromLTRB(76*fem, 0*fem, 75*fem, 26*fem),
              width: double.infinity,
              height: 195*fem,
              decoration: BoxDecoration (
                color: Color(0xffd9d9d9),
              ),
            ),
            Container(
              // bioEdo (167:235)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 234*fem, 21*fem),
              width: 101*fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // yaarasbioA1f (167:236)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 13*fem),
                    width: double.infinity,
                    child: Text(
                      'Yaara’s bio',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // heyhey4Mw (167:237)
                    width: double.infinity,
                    child: Text(
                      'Hey hey!',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // lookingforBxM (167:239)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 64*fem, 19*fem),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: SafeGoogleFont (
                    'Playfair Display',
                    fontSize: 20*ffem,
                    fontWeight: FontWeight.w800,
                    height: 1.3325*ffem/fem,
                    color: Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: 'Looking for ',
                    ),
                    TextSpan(
                      text: 'something casual',
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325*ffem/fem,
                        color: Color(0xfffb6656),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // intrestsTHb (167:240)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 94*fem, 123*fem),
              padding: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
              width: double.infinity,
              height: 56*fem,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(10*fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupcux7ZbX (Nr6r7RACj2Y8b49jiXcUx7)
                    width: 78*fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // intreststdo (167:241)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                          width: double.infinity,
                          child: Text(
                            'Intrests',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Playfair Display',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w800,
                              height: 1.3325*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupupm5zwj (Nr6rCv13TK9BkJYGeSUpm5)
                          width: double.infinity,
                          height: 19*fem,
                          decoration: BoxDecoration (
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(10*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Cooking',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Playfair Display',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3325*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupbv6x5iH (Nr6rRzTb1MjMu7wzasBV6X)
                    padding: EdgeInsets.fromLTRB(7*fem, 37*fem, 0*fem, 0*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // autogroupzmgkcCR (Nr6rHuriUr49M5Fr35zmgK)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                          width: 78*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(10*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Fishing',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Playfair Display',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3325*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupalddUEd (Nr6rMaRGy38BTErCf2aLDd)
                          width: 78*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffd9d9d9),
                            borderRadius: BorderRadius.circular(10*fem),
                          ),
                          child: Center(
                            child: Text(
                              'Art',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Playfair Display',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3325*ffem/fem,
                                color: Color(0xff000000),
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
            Container(
              // iconbarZWy (167:183)
              margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 0*fem),
              width: 293*fem,
              height: 80*fem,
              child: Image.asset(
                'assets/page-1/images/icon-bar-sgV.png',
                width: 293*fem,
                height: 80*fem,
              ),
            ),
          ],
        ),
      ),
          );
  }
}