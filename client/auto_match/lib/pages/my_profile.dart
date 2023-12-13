import 'package:AUTO_MATCH/pages/services/api.dart';
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

  Future<void> logout() async {
    final fetchResponse =
        await api.dio.post('${dotenv.env["SERVER_URL"]}/logout');
    final responseBody = fetchResponse.data.toString();

    print('responseBody: $responseBody');

    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: currentUser == null
              ? Container()
              : SizedBox(
                  width: double.infinity,
                  child: Container(
                    width: double.infinity,
                    height: 812 * fem,
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 150 * fem,
                                height: 150 * fem,
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
                            SizedBox(height: 30),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                // width: 56 * fem,
                                height: 30 * fem,
                                child: Text(
                                  'NAME',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
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
                                    'Plus Jakarta Sans',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
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
                                    'Plus Jakarta Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
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
                                    'Plus Jakarta Sans',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
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
                                    'Plus Jakarta Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
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
                                    'Plus Jakarta Sans',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
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
                                    'Plus Jakarta Sans',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
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
                                    'Plus Jakarta Sans',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.26 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              // signinbuttonJiZ (403:31)
                              margin: EdgeInsets.fromLTRB(
                                  1 * fem, 0 * fem, 0.47 * fem, 0 * fem),
                              child: TextButton(
                                onPressed: () {
                                  logout();
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 71 * fem,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 124, 0, 0),
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Logout',
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
                      )
                    ]),
                  ),
                ),
        ),
      ),
    );
  }
}
