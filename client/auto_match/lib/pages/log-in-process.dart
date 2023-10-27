import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/services/auth.dart';
import 'package:myapp/utils.dart';

class log_in_process extends StatefulWidget {
  const log_in_process({Key? key});

  @override
  log_in_processState createState() => log_in_processState();
}

class log_in_processState extends State<log_in_process> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle the sign-in action
  Future<void> signIn() async {
    // Implement your sign-in logic here
    final email = _emailController.text;
    final password = _passwordController.text;
    // Perform authentication and navigate to the next screen
    print(email);
    print(password);

    final signInStatus = await signInReq(
      email: email,
      password: password,
    );

    print('Sign-In Status: $signInStatus');

    //move to the next screeen
    Navigator.pushNamed(context, '/matches');
  }

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
        // loginprocess2c9 (2:14)
        padding: EdgeInsets.fromLTRB(31 * fem, 34 * fem, 31 * fem, 70 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logoRXo (140:132)
              margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 93 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-n9X.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // welcomebackKt5 (14:17)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 82 * fem),
              child: Text(
                'Welcome Back!',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Playfair Display',
                  fontSize: 40 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.3325 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // loginzDX (17:19)
              padding:
                  EdgeInsets.fromLTRB(12 * fem, 0 * fem, 12 * fem, 31 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backarrow2AD (17:7)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 241 * fem, 9 * fem),
                    width: 48 * fem,
                    height: 55 * fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-KPf.png',
                      width: 48 * fem,
                      height: 55 * fem,
                    ),
                  ),
                  Container(
                    // loginWr5 (9:5)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 99 * fem, 47 * fem),
                    child: Text(
                      'LOG IN',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // email129 (17:15)
                    margin: EdgeInsets.fromLTRB(
                        42 * fem, 0 * fem, 41 * fem, 12 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff000000)),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            17.5 * fem, 8 * fem, 17.5 * fem, 11 * fem),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // passwordoyb (17:16)
                    margin: EdgeInsets.fromLTRB(
                        42 * fem, 0 * fem, 41 * fem, 47 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff000000)),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            12 * fem, 10 * fem, 12 * fem, 9 * fem),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // autogroupw4xxpdo (Nr6cBuC4Y9zuJUf8YLw4xX)
                    margin: EdgeInsets.fromLTRB(
                        42 * fem, 0 * fem, 41 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        signIn();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 38 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffdee5ed),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000),
                              offset: Offset(7 * fem, 7 * fem),
                              blurRadius: 1 * fem,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'CONTINUE',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Playfair Display',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w800,
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
          ],
        ),
      ),
    )));
  }
}
