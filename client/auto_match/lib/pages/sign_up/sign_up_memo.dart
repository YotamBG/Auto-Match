import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Sign_up_memo extends StatefulWidget {
  const Sign_up_memo({super.key});

  @override
  State<Sign_up_memo> createState() => _Sign_up_memoState();
}

class _Sign_up_memoState extends State<Sign_up_memo> {
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
        padding:
            EdgeInsets.fromLTRB(43.5 * fem, 46 * fem, 48.5 * fem, 126 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(6 * fem, 0 * fem, 0 * fem, 87 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-swP.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 106 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        6 * fem, 0 * fem, 0 * fem, 43 * fem),
                    child: Text(
                      'DONE!',
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
                    constraints: BoxConstraints(
                      maxWidth: 283 * fem,
                    ),
                    child: Text(
                      'Lets find out whats your taste!',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 283 * fem,
                    ),
                    child: Text(
                      'Pick the faces you’re attracted to - to teach the system what you like and what you don’t',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(38.5 * fem, 0 * fem, 38.5 * fem, 0 * fem),
              child: TextButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/sign_up_face_training_1');
                  Navigator.pushNamed(context, '/sign_up_face_training',
                      arguments: {'pageNum': 1, 'lastPageNum': 3});
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
    )));
  }
}
