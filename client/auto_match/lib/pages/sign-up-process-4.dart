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
        // signupprocess4wJ9 (17:136)
        padding: EdgeInsets.fromLTRB(31*fem, 30*fem, 24*fem, 72*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logoSkh (140:136)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6*fem, 19*fem),
              width: 210*fem,
              height: 124*fem,
              child: Image.asset(
                'assets/page-1/images/logo-u53.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // signupZKX (17:137)
              width: double.infinity,
              height: 567*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // signuptch (17:139)
                    left: 36.5*fem,
                    top: 64*fem,
                    child: Align(
                      child: SizedBox(
                        width: 121*fem,
                        height: 40*fem,
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
                    ),
                  ),
                  Positioned(
                    // continuebuttonN25 (154:18)
                    left: 54*fem,
                    top: 486*fem,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 206*fem,
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
                  Positioned(
                    // genderZsF (17:143)
                    left: 66*fem,
                    top: 114*fem,
                    child: Container(
                      width: 194*fem,
                      height: 238*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(20*fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // imlookingfora43K (17:153)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15.6*fem),
                            width: double.infinity,
                            child: Text(
                              'Im looking for a...',
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
                            // femaleYz5 (17:150)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15.4*fem),
                            width: double.infinity,
                            height: 53.2*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(20*fem),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // femalebox5DK (17:151)
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
                                  // female9ys (17:152)
                                  left: 61.5239868164*fem,
                                  top: 10.4000244141*fem,
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
                            // maleSxy (17:147)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15.4*fem),
                            width: double.infinity,
                            height: 53.2*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(20*fem),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // maleyT7 (17:148)
                                  left: 72.0239868164*fem,
                                  top: 13.8000488281*fem,
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
                                  // boxTt5 (17:149)
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
                            // nonbinaryboxvWm (17:144)
                            width: double.infinity,
                            height: 53.2*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(20*fem),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  // nonbinaryG4q (17:145)
                                  left: 47.6839904785*fem,
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
                                  // box9eR (17:146)
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
                  ),
                  Positioned(
                    // backarrowd3o (17:155)
                    left: 21*fem,
                    top: 20.3333740234*fem,
                    child: Align(
                      child: SizedBox(
                        width: 24*fem,
                        height: 18.33*fem,
                        child: Image.asset(
                          'assets/page-1/images/back-arrow.png',
                          width: 24*fem,
                          height: 18.33*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroupgnn3LD7 (Nr6ebfWWiALNuEqbdNGnN3)
                    left: 74*fem,
                    top: 408*fem,
                    child: Align(
                      child: SizedBox(
                        width: 184*fem,
                        height: 17*fem,
                        child: Image.asset(
                          'assets/page-1/images/auto-group-gnn3.png',
                          width: 184*fem,
                          height: 17*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // autogroup3vdmS1F (Nr6ehkAiRfFDDNqv263vDM)
                    left: 149*fem,
                    top: 425*fem,
                    child: Container(
                      width: 28.5*fem,
                      height: 19*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // maxageknd (112:15)
                            left: 12.5*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 16*fem,
                                height: 19*fem,
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
                            ),
                          ),
                          Positioned(
                            // minageeND (112:11)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 15*fem,
                                height: 19*fem,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // ages945 (112:6)
                    left: 195.5*fem,
                    top: 366*fem,
                    child: Align(
                      child: SizedBox(
                        width: 69*fem,
                        height: 32*fem,
                        child: Text(
                          'Ages...',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Playfair Display',
                            fontSize: 24*ffem,
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
          );
  }
}