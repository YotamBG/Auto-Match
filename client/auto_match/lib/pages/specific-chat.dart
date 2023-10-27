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
        // specificchatdN9 (138:99)
        padding: EdgeInsets.fromLTRB(12*fem, 26.33*fem, 11*fem, 8*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogrouppspqYED (Nr6outzMGUe1CyvjLVPSPq)
              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 139*fem, 11*fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // backarrowU7s (139:125)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 104*fem, 0*fem),
                    width: 24*fem,
                    height: 18.33*fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-Qkq.png',
                      width: 24*fem,
                      height: 18.33*fem,
                    ),
                  ),
                  Container(
                    // profilepicagh (138:117)
                    margin: EdgeInsets.fromLTRB(0*fem, 16.67*fem, 0*fem, 0*fem),
                    width: 75*fem,
                    height: 75*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(37.5*fem),
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogrouphp4buDB (Nr6p1JzziJdNmpNSLrhP4B)
              margin: EdgeInsets.fromLTRB(129.5*fem, 0*fem, 129.5*fem, 64*fem),
              width: double.infinity,
              height: 54*fem,
              child: Stack(
                children: [
                  Positioned(
                    // nameSD7 (138:121)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 93*fem,
                        height: 40*fem,
                        child: Text(
                          'Daniel',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Playfair Display',
                            fontSize: 30*ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.3325*ffem/fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // locationiwK (138:122)
                    left: 11*fem,
                    top: 35*fem,
                    child: Align(
                      child: SizedBox(
                        width: 71*fem,
                        height: 19*fem,
                        child: Text(
                          '12 km away',
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
                  ),
                ],
              ),
            ),
            Container(
              // autogrouprw5hoC5 (Nr6p5osW35rEp7R4CErw5h)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 143*fem, 28*fem),
              width: 189*fem,
              height: 29*fem,
              child: Stack(
                children: [
                  Positioned(
                    // messageshapebackground7iZ (139:124)
                    left: 0*fem,
                    top: 4*fem,
                    child: Align(
                      child: SizedBox(
                        width: 189*fem,
                        height: 25*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(10*fem),
                            color: Color(0xffd9d9d9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // messageRUM (138:120)
                    left: 5.5*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 179*fem,
                        height: 27*fem,
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
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group10K3w (165:47)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 331*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(10*fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupuzjse6D (Nr6pKPKDHt8WXQVjfvuzJs)
                    margin: EdgeInsets.fromLTRB(141*fem, 0*fem, 0*fem, 27*fem),
                    width: 189*fem,
                    height: 29*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // messageshapebackgroundNH7 (165:45)
                          left: 0*fem,
                          top: 4*fem,
                          child: Align(
                            child: SizedBox(
                              width: 189*fem,
                              height: 25*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(10*fem),
                                  color: Color(0xffd9d9d9),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // message4fj (165:46)
                          left: 5.5*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 179*fem,
                              height: 27*fem,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // group10Meq (165:48)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 142*fem, 0*fem),
                    width: 210*fem,
                    height: 33*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // messageshapebackgroundHHb (165:49)
                          left: 10*fem,
                          top: 4*fem,
                          child: Align(
                            child: SizedBox(
                              width: 189*fem,
                              height: 25*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(10*fem),
                                  color: Color(0xffd9d9d9),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // messageyw7 (165:50)
                          left: 15.5*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 179*fem,
                              height: 27*fem,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // iconbart2V (138:100)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14.63*fem, 0*fem),
              width: 293.37*fem,
              height: 80*fem,
              child: Image.asset(
                'assets/page-1/images/icon-bar-4N5.png',
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