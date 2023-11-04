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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SizedBox(
            width: double.infinity,
            height: 812 * fem,
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(51 * fem, 41 * fem, 53 * fem, 114 * fem),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xfffaf4ef),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 200 * fem, 0 * fem, 21 * fem),
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
                        width: 270 * fem,
                        height: 71 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50 * fem),
                          image: const DecorationImage(
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
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
                    child: TextButton(
                      onPressed: () {
                        print('signup!');
                        Navigator.pushNamed(context, '/sign_up_info');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 270 * fem,
                        height: 71 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50 * fem),
                          image: const DecorationImage(
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
          ),
        ),
      ),
    );
  }
}
