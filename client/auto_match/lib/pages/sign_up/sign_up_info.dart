import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Sign_up_info extends StatefulWidget {
  const Sign_up_info({super.key});

  @override
  State<Sign_up_info> createState() => _Sign_up_infoState();
}

class _Sign_up_infoState extends State<Sign_up_info> {
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

    final email = _emailController.text;
    final password = _passwordController.text;
    final name = '${_firstNameController.text} ${_lastNameController.text}';
    const bio = 'bio';
    const location = 'TLV';
    final age = _ageController.text;

    // Register user
    final signUpStatus = await signUpReq(
        email: email,
        password: password,
        name: name,
        bio: bio,
        location: location,
        age: int.parse(age));
    print('Sign-Up Status: $signUpStatus');

    // Sign in user
    final signInStatus = await signInReq(
      email: email,
      password: password,
    );
    print('Sign-In Status: $signInStatus');

    //Hide loading
    Navigator.of(context).pop();

    //Move to the next screeen
    Navigator.pushNamed(context, '/sign_up_reels');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
            child: SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(32 * fem, 25 * fem, 23 * fem, 87 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10 * fem, 9 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-peu.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  20 * fem, 35.33 * fem, 34.75 * fem, 25 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        9.92 * fem, 0 * fem, 0 * fem, 27 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
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
                        hintStyle: const TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        9.92 * fem, 0 * fem, 0 * fem, 26 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
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
                        hintStyle: const TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        9.92 * fem, 0 * fem, 0 * fem, 26 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
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
                        hintStyle: const TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        10.25 * fem, 0 * fem, 0 * fem, 27 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
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
                        hintStyle: const TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        9.75 * fem, 0 * fem, 0 * fem, 67 * fem),
                    width: 255 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
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
                        hintStyle: const TextStyle(color: Color(0xff000000)),
                      ),
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        28 * fem, 0 * fem, 31.25 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        signUp();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 38 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xffdee5ed),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x3f000000),
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
                              color: const Color(0xff000000),
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
