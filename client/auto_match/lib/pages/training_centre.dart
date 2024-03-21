import 'package:AUTO_MATCH/pages/button_bar.dart';
import 'package:AUTO_MATCH/pages/top_bar.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            MyTopBar('Matches'),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30*fem),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // signinbuttonJiZ (403:31)
                      margin: EdgeInsets.fromLTRB(
                          1 * fem, 0 * fem, 0.47 * fem, 0 * fem),
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
                          width: double.infinity,
                          height: 61 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff2c2c2c),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Face training',
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
                    Container(
                      // signinbuttonJiZ (403:31)
                      margin: EdgeInsets.fromLTRB(
                          1 * fem, 0 * fem, 0.47 * fem, 0 * fem),
                      child: TextButton(
                        onPressed: () {
                          print('sign_up_reels!');
                          print(dotenv.env['SERVER_URL']);
                          Navigator.pushNamed(context, '/sign_up_reels',
                              arguments: {'pop': true});
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 61 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff2c2c2c),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Submit reels',
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
                    Container(
                      // signinbuttonJiZ (403:31)
                      margin: EdgeInsets.fromLTRB(
                          1 * fem, 0 * fem, 0.47 * fem, 0 * fem),
                      child: TextButton(
                        onPressed: () {
                          print('sign_up_songs!');
                          print(dotenv.env['SERVER_URL']);
                          Navigator.pushNamed(context, '/sign_up_songs',
                              arguments: {'pop': true});
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 61 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff2c2c2c),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Sumbit songs',
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
                    Container(
                      // signinbuttonJiZ (403:31)
                      margin: EdgeInsets.fromLTRB(
                          1 * fem, 0 * fem, 0.47 * fem, 0 * fem),
                      child: TextButton(
                        onPressed: () {
                          print('sign_up_filters!');
                          print(dotenv.env['SERVER_URL']);
                          Navigator.pushNamed(context, '/sign_up_filters',
                              arguments: {'pop': true});
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 61 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xff2c2c2c),
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Center(
                            child: Text(
                              'Adjust filters',
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
                  ],
                ),
              ),
            ),
            MyButtonBar('training_centre')
          ],
        ),
      ),
    );
  }
}
