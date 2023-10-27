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
        // signupprocess3ukD (17:86)
        padding: EdgeInsets.fromLTRB(31*fem, 24*fem, 24*fem, 72*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logodRK (140:135)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6*fem, 25*fem),
              width: 210*fem,
              height: 124*fem,
              child: Image.asset(
                'assets/page-1/images/logo-Bb7.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // signupkF3 (17:87)
              padding: EdgeInsets.fromLTRB(21*fem, 20.33*fem, 21*fem, 40*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // backarrowTQM (17:105)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25.33*fem),
                    width: 24*fem,
                    height: 18.33*fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-Hoo.png',
                      width: 24*fem,
                      height: 18.33*fem,
                    ),
                  ),
                  Container(
                    // signupZiH (17:89)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 61*fem),
                    width: double.infinity,
                    child: Text(
                      'SIGN UP',
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
                  Container(
                    // gendernL9 (17:101)
                    margin: EdgeInsets.fromLTRB(42*fem, 0*fem, 42*fem, 86*fem),
                    width: double.infinity,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // iamaJJV (17:103)
                          margin: EdgeInsets.fromLTRB(1.23*fem, 0*fem, 0*fem, 15.6*fem),
                          child: Text(
                            'I am a...',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Playfair Display',
                              fontSize: 24*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.3325*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // femalePqj (17:110)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15.4*fem),
                          width: double.infinity,
                          height: 53.2*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // femalebox713 (17:102)
                                left: 0*fem,
                                top: 0.0001220703*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 194*fem,
                                    height: 53.2*fem,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(20*fem),
                                          border: Border.all(color: Color(0xff000000)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // femalez4q (17:108)
                                left: 65.5*fem,
                                top: 13.4000244141*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 65*fem,
                                    height: 27*fem,
                                    child: Text(
                                      'Female',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Playfair Display',
                                        fontSize: 20*ffem,
                                        fontWeight: FontWeight.w500,
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
                          // maleboxHJq (17:115)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15.4*fem),
                          width: double.infinity,
                          height: 53.2*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // malec6D (17:116)
                                left: 72*fem,
                                top: 11.8000488281*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 44*fem,
                                    height: 27*fem,
                                    child: Text(
                                      'Male',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Playfair Display',
                                        fontSize: 20*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3325*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // boxVfo (17:117)
                                left: 0*fem,
                                top: 0.0001220703*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 194*fem,
                                    height: 53.2*fem,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(20*fem),
                                          border: Border.all(color: Color(0xff000000)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // nonbinaryboxNzV (17:114)
                          width: double.infinity,
                          height: 53.2*fem,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20*fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // nonbinary7x5 (17:113)
                                left: 43.5*fem,
                                top: 11.1999511719*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 101*fem,
                                    height: 27*fem,
                                    child: Text(
                                      'Non binary',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Playfair Display',
                                        fontSize: 20*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3325*ffem/fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // boxoK7 (17:109)
                                left: 0*fem,
                                top: 0*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 194*fem,
                                    height: 53.2*fem,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom (
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(20*fem),
                                          border: Border.all(color: Color(0xff000000)),
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
                  Container(
                    // continuebuttongdo (154:15)
                    margin: EdgeInsets.fromLTRB(33*fem, 0*fem, 39*fem, 0*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 38*fem,
                        decoration: BoxDecoration (
                          color: Color(0xffdee5ed),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(7*fem, 7*fem),
                              blurRadius: 2*fem,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'CONTINUE',
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          );
  }
}