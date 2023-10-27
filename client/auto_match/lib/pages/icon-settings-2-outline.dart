import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 52.3659667969;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iconsettings2outline5mj (120:109)
        padding: EdgeInsets.fromLTRB(4.36*fem, 4.36*fem, 4.36*fem, 4.36*fem),
        width: double.infinity,
        height: 52.37*fem,
        decoration: BoxDecoration (
          color: Color(0x00ffffff),
        ),
        child: Center(
          // groupz81 (120:106)
          child: SizedBox(
            width: 43.64*fem,
            height: 43.64*fem,
            child: Image.asset(
              'assets/page-1/images/group-HS9.png',
              width: 43.64*fem,
              height: 43.64*fem,
            ),
          ),
        ),
      ),
          );
  }
}