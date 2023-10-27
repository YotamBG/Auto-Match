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
        // profileCgh (166:51)
        padding: EdgeInsets.fromLTRB(40*fem, 41*fem, 34*fem, 6*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // myprofilepicuLD (166:69)
              margin: EdgeInsets.fromLTRB(90*fem, 0*fem, 96*fem, 4*fem),
              width: double.infinity,
              height: 115*fem,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(57.5*fem),
                color: Color(0xffd9d9d9),
              ),
            ),
            Container(
              // mynamedGD (166:72)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6*fem, 125*fem),
              child: Text(
                'Yaara',
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
              // editandpreview8Cy (166:83)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31*fem, 32*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 270*fem,
                  height: 71*fem,
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(50*fem),
                    image: DecorationImage (
                      fit: BoxFit.cover,
                      image: AssetImage (
                        'assets/page-1/images/rectangle-2-89f.png',
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Edit profile',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 24*ffem,
                        height: 1.3325*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // preferencesxSu (166:86)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31*fem, 30*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 270*fem,
                  height: 71*fem,
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(50*fem),
                    image: DecorationImage (
                      fit: BoxFit.cover,
                      image: AssetImage (
                        'assets/page-1/images/rectangle-2-Aw3.png',
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'preferences',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 24*ffem,
                        height: 1.3325*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // trainsystemP2R (166:89)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 31*fem, 126*fem),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 270*fem,
                  height: 71*fem,
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(50*fem),
                    image: DecorationImage (
                      fit: BoxFit.cover,
                      image: AssetImage (
                        'assets/page-1/images/rectangle-2.png',
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Train system',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Playfair Display',
                        fontSize: 24*ffem,
                        height: 1.3325*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // iconbarE33 (166:52)
              margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 0*fem, 0*fem),
              width: 293*fem,
              height: 80*fem,
              child: Image.asset(
                'assets/page-1/images/icon-bar-Los.png',
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