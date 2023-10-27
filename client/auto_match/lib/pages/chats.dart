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
        // chats9Wy (137:16)
        padding: EdgeInsets.fromLTRB(21*fem, 18*fem, 10.5*fem, 8*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // autogroupp3yjeid (Nr6nHH3LuBkXBz66cNp3Yj)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7.5*fem, 51*fem),
              width: 30*fem,
              height: 30*fem,
              child: Image.asset(
                'assets/page-1/images/auto-group-p3yj.png',
                width: 30*fem,
                height: 30*fem,
              ),
            ),
            Container(
              // autogroupm9rf99b (Nr6nRrdP8T7qJWTChRM9rf)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 74*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        // profilepic3Vs (137:53)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9.5*fem, 4*fem),
                        width: 75*fem,
                        height: 75*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(37.5*fem),
                          color: Color(0xffd9d9d9),
                        ),
                      ),
                      Container(
                        // autogrouppue3AaV (Nr6nZ267Xv2YL1kG6DPUe3)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 45*fem, 2*fem),
                        width: 180*fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // nameJAu (138:60)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                              width: double.infinity,
                              child: Text(
                                'Daniel',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Playfair Display',
                                  fontSize: 24*ffem,
                                  fontWeight: FontWeight.w800,
                                  height: 1.3325*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            Container(
                              // lastmessageCXB (138:59)
                              width: double.infinity,
                              child: Text(
                                'Hey cutie whats up?',
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
                          ],
                        ),
                      ),
                      Text(
                        // lastmessagetimeK61 (138:61)
                        '11:26',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Playfair Display',
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.3325*ffem/fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // autogroupqnzk2m7 (Nr6niBVWkPhdbRj9e4qNzK)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 78*fem),
              width: double.infinity,
              height: 75*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // profilepicxem (165:37)
                    width: 75*fem,
                    height: 75*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(37.5*fem),
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                  Container(
                    // autogrouprqsuJCq (Nr6nw1TUT4Sky1JPorrqsu)
                    padding: EdgeInsets.fromLTRB(14.5*fem, 0*fem, 0*fem, 0*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupxjsyqCm (Nr6npqy5T6vF4TMFVbXJsy)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 40*fem, 12*fem),
                          width: 180*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // namexYH (165:40)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                width: double.infinity,
                                child: Text(
                                  'Daniel',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Playfair Display',
                                    fontSize: 24*ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.3325*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // lastmessagefBo (165:39)
                                width: double.infinity,
                                child: Text(
                                  'Hey cutie whats up?',
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
                            ],
                          ),
                        ),
                        Container(
                          // lastmessagetimeaJm (165:41)
                          margin: EdgeInsets.fromLTRB(0*fem, 30*fem, 0*fem, 0*fem),
                          child: Text(
                            '11:26',
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
                ],
              ),
            ),
            Container(
              // autogroupgjtvUf3 (Nr6o7RKnvRM68cTgCsgjTV)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 244*fem),
              width: double.infinity,
              height: 75*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // profilepicohK (165:38)
                    width: 75*fem,
                    height: 75*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(37.5*fem),
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                  Container(
                    // autogroupydnfx4R (Nr6oJafrwunZdw8PunYDNf)
                    padding: EdgeInsets.fromLTRB(19.5*fem, 7*fem, 0*fem, 5*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // autogroupm51z5Pw (Nr6oDLKc512ZFvaLkWM51Z)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 40*fem, 0*fem),
                          width: 180*fem,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // nameoKw (165:43)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                width: double.infinity,
                                child: Text(
                                  'Daniel',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Playfair Display',
                                    fontSize: 24*ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.3325*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // lastmessageKZB (165:42)
                                width: double.infinity,
                                child: Text(
                                  'Hey cutie whats up?',
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
                            ],
                          ),
                        ),
                        Container(
                          // lastmessagetimeFhj (165:44)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                          child: Text(
                            '11:26',
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
                ],
              ),
            ),
            Container(
              // iconbarNGZ (137:17)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37.13*fem, 0*fem),
              width: 293.37*fem,
              height: 80*fem,
              child: Image.asset(
                'assets/page-1/images/icon-bar-4vD.png',
                width: 293.37*fem,
                height: 80*fem,
              ),
            ),
          ],
        ),
      ),
          );
  }
}