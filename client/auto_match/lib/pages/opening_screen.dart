import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Opening_screen extends StatefulWidget {
  const Opening_screen({super.key});

  @override
  Opening_screenState createState() => Opening_screenState();
}

class Opening_screenState extends State<Opening_screen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: SizedBox(
              width: double.infinity,
              height: 812 * fem,
              child: Container(
                // splashpbf (401:17)
                padding:
                    EdgeInsets.fromLTRB(42 * fem, 45 * fem, 43 * fem, 92 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // logoih3 (402:18)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 12.22 * fem),
                      width: 290 * fem,
                      height: 284.78 * fem,
                      child: Image.asset(
                        'assets/page-1/images/logo-JQD.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // automatch3UR (401:29)
                      margin: EdgeInsets.fromLTRB(
                          1 * fem, 0 * fem, 0 * fem, 109 * fem),
                      child: Text(
                        'AUTO-MATCH',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Plus Jakarta Sans',
                          fontSize: 40 * ffem,
                          fontWeight: FontWeight.w300,
                          height: 1.26 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // signinbuttonktd (402:20)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 26 * fem),
                      child: TextButton(
                        onPressed: () {
                          print('login!');
                          print(dotenv.env['SERVER_URL']);
                          Navigator.pushNamed(context, '/login');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 71 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff2c2c2c),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Plus Jakarta Sans',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.26 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      // signupbuttonoM7 (402:24)
                      onPressed: () {
                          print('signup!');
                          Navigator.pushNamed(context, '/sign_up_info');
                        },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 71 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff2c2c2c),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Plus Jakarta Sans',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.26 * ffem / fem,
                              color: Color(0xffffffff),
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
      ),
    );
  }
}
