import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';



class opening_screen extends StatefulWidget {
  const opening_screen({Key? key});

  @override
  opening_screenState createState() => opening_screenState();
}

class opening_screenState extends State<opening_screen> {
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
            // openingscreenckq (17:13)
            width: double.infinity,
            height: 812 * fem,
            child: Container(
              // backgroundNED (1:2)
              padding:
                  EdgeInsets.fromLTRB(51 * fem, 41 * fem, 53 * fem, 114 * fem),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfffaf4ef),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // logogEu (140:127)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 100 * fem, 0 * fem, 52 * fem),
                    width: 210 * fem,
                    height: 124 * fem,
                    child: Image.asset(
                      'assets/page-1/images/logo-TyK.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // loginbuttonjDB (14:16)
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 200 * fem, 0 * fem, 21 * fem),
                    child: TextButton(
                      onPressed: () {
                        print('login!');
                        Navigator.pushNamed(context, '/login');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 270 * fem,
                        height: 71 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50 * fem),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/page-1/images/rectangle-1.png',
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'LOG IN',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Playfair Display',
                              fontSize: 24 * ffem,
                              height: 1.3325 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // signupbutton9Xo (14:15)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        print('signup!');
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 270 * fem,
                        height: 71 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50 * fem),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/page-1/images/rectangle-2-4ZX.png',
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'SIGN UP',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Playfair Display',
                              fontSize: 24 * ffem,
                              height: 1.3325 * ffem / fem,
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
          ),
        ),
      ),
    );
  }
}
