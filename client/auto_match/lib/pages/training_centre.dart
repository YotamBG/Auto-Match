import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Training_centre extends StatefulWidget {
  const Training_centre({super.key});

  @override
  Training_centreState createState() => Training_centreState();
}

class Training_centreState extends State<Training_centre> {
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
                      child: Text(
                        'Training centre',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Playfair Display',
                          fontSize: 24 * ffem,
                          height: 1.3325 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 20 * fem, 0 * fem, 21 * fem),
                    child: TextButton(
                      onPressed: () {
                        print('sign_up_face_training!');
                        print(dotenv.env['SERVER_URL']);
                        Navigator.pushNamed(context, '/sign_up_face_training',
                            arguments: {'pageNum': 4, 'lastPageNum': 6});
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
                            'Face Training',
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
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 20 * fem, 0 * fem, 21 * fem),
                    child: TextButton(
                      onPressed: () {
                        print('sign_up_reels!');
                        print(dotenv.env['SERVER_URL']);
                        Navigator.pushNamed(context, '/sign_up_reels');
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
                            'Submit reels',
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
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 20 * fem, 0 * fem, 21 * fem),
                    child: TextButton(
                      onPressed: () {
                        print('sign_up_music!');
                        print(dotenv.env['SERVER_URL']);
                        Navigator.pushNamed(context, '/sign_up_music');
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
                            'Sumbit music',
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
