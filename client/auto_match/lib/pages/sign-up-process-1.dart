import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/services/auth.dart';
import 'package:myapp/utils.dart';

class sign_up_process_1 extends StatefulWidget {
  @override
  State<sign_up_process_1> createState() => _sign_up_process_1State();
}

class _sign_up_process_1State extends State<sign_up_process_1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Function to handle the sign-in action
  Future<void> signUp() async {
    //show loading
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AlertDialog(
        content: SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    // Implement your sign-in logic here
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _firstNameController.text + ' ' + _lastNameController.text;
    final bio = 'bio';
    final location = 'TLV';
    final age = _ageController.text;
    // Perform authentication and navigate to the next screen
    print(email);
    print(password);
    print(name);
    print(bio);
    print(location);
    print(age);

    // send req to server
    final signUpStatus = await signUpReq(
        email: email,
        password: password,
        name: name,
        bio: bio,
        location: location,
        age: int.parse(age));

    final signInStatus = await signInReq(
      email: email,
      password: password,
    );

    print('Sign-Up Status: $signUpStatus');
    print('Sign-In Status: $signInStatus');

    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    
    
    Navigator.pushNamed(context, '/signup5');
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
        // signupprocess1RDb (17:26)
        padding: EdgeInsets.fromLTRB(32 * fem, 25 * fem, 23 * fem, 87 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logoiiV (140:133)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10 * fem, 9 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-peu.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // signupSPb (17:27)
              padding: EdgeInsets.fromLTRB(
                  20 * fem, 35.33 * fem, 34.75 * fem, 25 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // backarrow8XK (17:41)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 241.25 * fem, 10.33 * fem),
                    width: 24 * fem,
                    height: 18.33 * fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-jXo.png',
                      width: 24 * fem,
                      height: 18.33 * fem,
                    ),
                  ),
                  Container(
                    // signup3PP (17:29)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 111.25 * fem, 85 * fem),
                    child: Text(
                      'SIGN UP',
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
                    // firstnamewDs (17:43)
                    margin: EdgeInsets.fromLTRB(
                        9.92 * fem, 0 * fem, 0 * fem, 27 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff000000)),
                    ),
                    child: TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            11.4 * fem, 11 * fem, 11.4 * fem, 12 * fem),
                        hintText: 'First name',
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
                    // lastnameAsK (17:47)
                    margin: EdgeInsets.fromLTRB(
                        9.92 * fem, 0 * fem, 0 * fem, 26 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff000000)),
                    ),
                    child: TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            12.9 * fem, 11 * fem, 12.9 * fem, 12 * fem),
                        hintText: 'Last name',
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
                    // lastnameAsK (17:47)
                    margin: EdgeInsets.fromLTRB(
                        9.92 * fem, 0 * fem, 0 * fem, 26 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff000000)),
                    ),
                    child: TextField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            12.9 * fem, 11 * fem, 12.9 * fem, 12 * fem),
                        hintText: 'Age',
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
                    // emailCp1 (17:33)
                    margin: EdgeInsets.fromLTRB(
                        10.25 * fem, 0 * fem, 0 * fem, 27 * fem),
                    width: 255 * fem,
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
                            13.55 * fem, 11 * fem, 13.55 * fem, 12 * fem),
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
                    // passwordEVo (17:36)
                    margin: EdgeInsets.fromLTRB(
                        9.75 * fem, 0 * fem, 0 * fem, 67 * fem),
                    width: 255 * fem,
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
                            15 * fem, 10 * fem, 15 * fem, 13 * fem),
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
                    // continuebuttonepR (17:30)
                    margin: EdgeInsets.fromLTRB(
                        28 * fem, 0 * fem, 31.25 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        print('HELLO!');
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        final name = _firstNameController.text +
                            ' ' +
                            _lastNameController.text;
                        print(name);
                        signUp();
                        print('done!');
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
                              color: Color(0x3f000000),
                              offset: Offset(7 * fem, 7 * fem),
                              blurRadius: 2 * fem,
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
