import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_match/services/utils.dart';


class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // openingscreenc3T (17:13)
        width: double.infinity,
        height: 812*fem,
        child: Container(
          // backgroundAKs (1:2)
          padding: EdgeInsets.fromLTRB(51*fem, 41*fem, 53*fem, 114*fem),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xfffaf4ef),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // logoHfP (2:13)
                margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 0*fem, 53*fem),
                constraints: BoxConstraints (
                  maxWidth: 248*fem,
                ),
                child: Text(
                  'AUTO MATCH',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont (
                    'Chango',
                    fontSize: 50*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.21*ffem/fem,
                    color: Color(0xff10409a),
                  ),
                ),
              ),
              Container(
                // picturesPCd (2:6)
                margin: EdgeInsets.fromLTRB(26*fem, 0*fem, 0*fem, 75*fem),
                width: 245*fem,
                height: 245*fem,
                decoration: BoxDecoration (
                  color: Color(0xffd9d9d9),
                ),
              ),
              Container(
                // loginbuttonWo3 (14:16)
                margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 21*fem),
                width: 270*fem,
                height: 71*fem,
                decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(50*fem),
                  image: DecorationImage (
                    fit: BoxFit.cover,
                    image: AssetImage (
                      'assets/page-1/images/rectangle-1.png',
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Log in',
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
              Container(
                // signupbuttonwtM (14:15)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
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
                    'Sign up',
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
            ],
          ),
        ),
      ),
          );
  }
}