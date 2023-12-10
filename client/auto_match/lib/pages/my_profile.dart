import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class My_profile extends StatefulWidget {
  const My_profile({super.key});

  @override
  My_profileState createState() => My_profileState();
}

class My_profileState extends State<My_profile> {
  var currentUser;
  var serverURL = dotenv.env["SERVER_URL"];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    try {
      // get user
      final currentUserObject = await profileReq();

      // profile_data = {
      //         'name': user.name,
      //         'bio': user.bio,
      //         'id': current_user.id,
      //         'location': user.location,
      //         'age': user.age,
      //     }
      setState(() {
        currentUser = currentUserObject;
      });
    } catch (e) {
      print('Error loading user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: currentUser == null
            ? Container()
            : SizedBox(
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  height: 812 * fem,
                  decoration: const BoxDecoration(
                    color: Color(0xfffaf4ef),
                  ),
                  child: Stack(children: [
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
                              'LOGOUT',
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
                      top: 60 * fem,
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
                    
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(height: 150) ,
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 100 * fem,
                              height: 100 * fem,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    '${serverURL}/pic/${currentUser['id']}/profilePic.png',
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  )),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              // width: 56 * fem,
                              height: 30 * fem,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              // width: 35 * fem,
                              height: 50 * fem,
                              child: Text(
                                currentUser['name'],
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              // width: 34 * fem,
                              height: 30 * fem,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              // width: 54 * fem,
                              height: 50 * fem,
                              child: Text(
                                currentUser['bio'],
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              // width: 146 * fem,
                              height: 30 * fem,
                              child: Text(
                                'AGE',
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              // width: 69 * fem,
                              height: 50 * fem,
                              child: Text(
                                currentUser['age'].toString(),
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              // width: 100 * fem,
                              height: 30 * fem,
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              // width: 88 * fem,
                              height: 50 * fem,
                              child: Text(
                                currentUser['location'],
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
                    )
                  ]),
                ),
              ),
      ),
    );
  }
}
