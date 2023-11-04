import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class Scene extends StatelessWidget {
  const Scene({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 812 * fem,
        decoration: const BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 48 * fem,
              top: 726 * fem,
              child: Align(
                child: SizedBox(
                  width: 293 * fem,
                  height: 80 * fem,
                  child: Image.asset(
                    'assets/page-1/images/icon-bar.png',
                    width: 293 * fem,
                    height: 80 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 138 * fem,
              top: 155 * fem,
              child: Align(
                child: SizedBox(
                  width: 100 * fem,
                  height: 100 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50 * fem),
                      color: const Color(0xffd9d9d9),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 21 * fem,
              top: 377 * fem,
              child: Align(
                child: SizedBox(
                  width: 56 * fem,
                  height: 27 * fem,
                  child: Text(
                    'NAME',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 21 * fem,
              top: 442 * fem,
              child: Align(
                child: SizedBox(
                  width: 146 * fem,
                  height: 27 * fem,
                  child: Text(
                    'DATE OF BIRTH',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40 * fem,
              top: 92 * fem,
              child: SizedBox(
                width: 303.5 * fem,
                height: 32 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 144.5 * fem, 0 * fem),
                      child: Text(
                        'EDIT',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Playfair Display',
                          fontSize: 24 * ffem,
                          height: 1.3325 * ffem / fem,
                          color: const Color(0xff1f4095),
                        ),
                      ),
                    ),
                    Text(
                      'PREVIEW',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 24 * ffem,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 25 * fem,
              top: 30.3333435059 * fem,
              child: Align(
                child: SizedBox(
                  width: 24 * fem,
                  height: 18.33 * fem,
                  child: Image.asset(
                    'assets/page-1/images/back-arrow-CiD.png',
                    width: 24 * fem,
                    height: 18.33 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 21 * fem,
              top: 264 * fem,
              child: SizedBox(
                width: 334 * fem,
                height: 77 * fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 79 * fem,
                      height: 77 * fem,
                      decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                    SizedBox(
                      width: 6 * fem,
                    ),
                    Container(
                      width: 79 * fem,
                      height: 77 * fem,
                      decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                    SizedBox(
                      width: 6 * fem,
                    ),
                    Container(
                      width: 79 * fem,
                      height: 77 * fem,
                      decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                    SizedBox(
                      width: 6 * fem,
                    ),
                    Container(
                      width: 79 * fem,
                      height: 77 * fem,
                      decoration: const BoxDecoration(
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 22 * fem,
              top: 507 * fem,
              child: Align(
                child: SizedBox(
                  width: 100 * fem,
                  height: 27 * fem,
                  child: Text(
                    'LOCATION\n',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 21.5 * fem,
              top: 572 * fem,
              child: Align(
                child: SizedBox(
                  width: 80 * fem,
                  height: 27 * fem,
                  child: Text(
                    'GENDER',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 23 * fem,
              top: 406 * fem,
              child: Align(
                child: SizedBox(
                  width: 35 * fem,
                  height: 19 * fem,
                  child: Text(
                    'yaara',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20 * fem,
              top: 537 * fem,
              child: Align(
                child: SizedBox(
                  width: 88 * fem,
                  height: 19 * fem,
                  child: Text(
                    'Pardes Hanna',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24.5 * fem,
              top: 602 * fem,
              child: Align(
                child: SizedBox(
                  width: 48 * fem,
                  height: 19 * fem,
                  child: Text(
                    'Woman',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.5 * fem,
              top: 471 * fem,
              child: Align(
                child: SizedBox(
                  width: 69 * fem,
                  height: 19 * fem,
                  child: Text(
                    '25062003',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 22 * fem,
              top: 624 * fem,
              child: Align(
                child: SizedBox(
                  width: 34 * fem,
                  height: 27 * fem,
                  child: Text(
                    'BIO',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 21.5 * fem,
              top: 653 * fem,
              child: Align(
                child: SizedBox(
                  width: 54 * fem,
                  height: 19 * fem,
                  child: Text(
                    'Hey hey!',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25.5 * fem,
              top: 678 * fem,
              child: Align(
                child: SizedBox(
                  width: 85 * fem,
                  height: 27 * fem,
                  child: Text(
                    'HOBBIES',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Playfair Display',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.3325 * ffem / fem,
                      color: const Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 31 * fem,
              top: 707 * fem,
              child: Container(
                width: 248 * fem,
                height: 19 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 78 * fem,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'Cooking',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Playfair Display',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3325 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7 * fem,
                    ),
                    Container(
                      width: 78 * fem,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'Fishing',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Playfair Display',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3325 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7 * fem,
                    ),
                    Container(
                      width: 78 * fem,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Center(
                        child: Text(
                          'Art',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Playfair Display',
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3325 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
