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
        // prefrences4js (167:248)
        padding: EdgeInsets.fromLTRB(25*fem, 30.33*fem, 28*fem, 6*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // backarrowxqF (167:272)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 53.33*fem),
              width: 24*fem,
              height: 18.33*fem,
              child: Image.asset(
                'assets/page-1/images/back-arrow-Zhb.png',
                width: 24*fem,
                height: 18.33*fem,
              ),
            ),
            Container(
              // autogroupnowxfUm (Nr6rtZXeXjz8ApVa5SNoWX)
              margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 0*fem, 26*fem),
              width: double.infinity,
              height: 141*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupqhm1z1F (Nr6s4ZEzaop3NMvirjQhM1)
                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 93*fem, 2*fem),
                    width: 162*fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // lookingforJGq (167:267)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2*fem),
                          width: double.infinity,
                          child: Text(
                            'Looking for',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Playfair Display',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3325*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // somethingcasualbWq (167:303)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                          width: double.infinity,
                          child: Text(
                            'something casual',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Playfair Display',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w800,
                              height: 1.3325*ffem/fem,
                              color: Color(0xfffb6656),
                            ),
                          ),
                        ),
                        Container(
                          // lookingforJg9 (167:304)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                          width: double.infinity,
                          child: Text(
                            'Looking for',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Playfair Display',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3325*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // men2MF (167:305)
                          width: double.infinity,
                          child: Text(
                            'Men',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Playfair Display',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w800,
                              height: 1.3325*ffem/fem,
                              color: Color(0xfffb6656),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupubx5kHF (Nr6sFJS6C1B6ucsJwvUBX5)
                    width: 61*fem,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          // mynameW1X (167:280)
                          left: 8*fem,
                          top: 27*fem,
                          child: Align(
                            child: SizedBox(
                              width: 45*fem,
                              height: 32*fem,
                              child: Text(
                                ' show on profile',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Playfair Display',
                                  fontSize: 12*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3325*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // iconeyeoffC9F (167:302)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            width: 61*fem,
                            height: 141*fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Opacity(
                                  // vectoruZT (167:296)
                                  opacity: 0,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 10*fem, 57*fem),
                                    width: double.infinity,
                                    height: 26*fem,
                                    decoration: BoxDecoration (
                                      color: Color(0x00ffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  // groupqCD (167:297)
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // iconeyeoffn7T (167:306)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                        width: 37*fem,
                                        height: 26*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/icon-eye-off.png',
                                          width: 37*fem,
                                          height: 26*fem,
                                        ),
                                      ),
                                      Container(
                                        // mynameHa1 (167:313)
                                        constraints: BoxConstraints (
                                          maxWidth: 61*fem,
                                        ),
                                        child: Text(
                                          'Don’t show on profile',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Playfair Display',
                                            fontSize: 12*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3325*ffem/fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
              // agescMP (167:320)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28*fem),
              width: double.infinity,
              child: Text(
                'Ages',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Playfair Display',
                  fontSize: 20*ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.3325*ffem/fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogroupdu8o8qX (Nr6sknaxeSxkwmVokYDU8o)
              margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 0*fem, 2*fem),
              width: 289*fem,
              height: 18*fem,
              child: Image.asset(
                'assets/page-1/images/auto-group-du8o.png',
                width: 289*fem,
                height: 18*fem,
              ),
            ),
            Container(
              // autogrouplzvwF9T (Nr6svCUwiJUtzRKB52LZvw)
              margin: EdgeInsets.fromLTRB(53*fem, 0*fem, 185.5*fem, 362*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // minageZfw (167:398)
                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 52.5*fem, 0*fem),
                    child: Text(
                      '23',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // maxagetCR (167:396)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                    child: Text(
                      '29',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 14*ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // iconbarbMj (167:249)
              margin: EdgeInsets.fromLTRB(23*fem, 0*fem, 0*fem, 0*fem),
              width: 293*fem,
              height: 80*fem,
              child: Image.asset(
                'assets/page-1/images/icon-bar-6KK.png',
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