import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  Log_inState createState() => Log_inState();
}

class Log_inState extends State<Log_in> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle the sign-in action
  Future<void> signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Perform authentication
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
            child: SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.fromLTRB(31 * fem, 34 * fem, 31 * fem, 70 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 93 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-n9X.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 82 * fem),
              child: Text(
                'Welcome Back!',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'Playfair Display',
                  fontSize: 40 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.3325 * ffem / fem,
                  color: const Color(0xff000000),
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(12 * fem, 0 * fem, 12 * fem, 31 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        42 * fem, 0 * fem, 41 * fem, 12 * fem),
                    width: double.infinity,
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
                            17.5 * fem, 8 * fem, 17.5 * fem, 11 * fem),
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
                        42 * fem, 0 * fem, 41 * fem, 47 * fem),
                    width: double.infinity,
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
                            12 * fem, 10 * fem, 12 * fem, 9 * fem),
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
                          color: const Color(0xffdee5ed),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000),
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
