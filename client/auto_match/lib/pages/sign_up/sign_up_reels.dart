import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';

class Sign_up_reels extends StatefulWidget {
  const Sign_up_reels({super.key});

  @override
  State<Sign_up_reels> createState() => _Sign_up_reelsState();
}

class _Sign_up_reelsState extends State<Sign_up_reels> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var pop;

  @override
  void initState() {
    super.initState();
    // fetchImageData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadPage();
  }

  Future<void> loadPage() async {
    var argObject = ModalRoute.of(context)!.settings.arguments as dynamic;
    var popArg = argObject['pop'];
    setState(() {
      pop = popArg;
    });
  }

  // if (pop == true) {
  //       Navigator.pushNamed(context, '/matches');
  //     } else {
  //       Navigator.pushNamed(context, '/');
  //     }

  Future<void> submitReels() async {
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

    final username = _usernameController.text;
    final password = _passwordController.text;

    // send req to server
    print('Sending req to server...');
    final jsonData = {
      "username": username,
      "password": password,
    };
    print('jsonData:');
    print(jsonData);

    try {
      final reelsReq = await api.dio.post(
        '${dotenv.env["SERVER_URL"]}/submit-reels',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(jsonData),
      );

      final reelsReqResponse = reelsReq.data.toString();
      print('Server Response: $reelsReqResponse');
      // print('reelsReq.statusCode: ${reelsReq.statusCode}');
      if (pop == true) {
        Navigator.pushNamed(context, '/matches');
      } else {
        Navigator.pushNamed(context, '/sign_up_songs');
      }
    } catch (e) {
      print(e);
      print('error!');
      // show dialog to user - encouraging them to go to the use the manual functions in the training center
      Navigator.of(context).pop();
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          content: SizedBox(
            height: 150,
            width: 200,
            child: Column(
              children: [
                Text(
                    'Oops! Please try again or use the training centre later on',
                    style: SafeGoogleFont(
                      'Plus Jakarta Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff000000),
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    if (pop == true) {
                      Navigator.pushNamed(context, '/matches');
                    } else {
                      Navigator.pushNamed(context, '/sign_up_songs');
                    }
                  },
                  child: Text('OK',
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Navigator.of(context).pop();
    //hide loading
    // Navigator.of(context).pop();
    //move to the next screeen
  }

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
        child: Container(
          // signup2JR3 (405:161)
          padding:
              EdgeInsets.fromLTRB(26 * fem, 33 * fem, 36.5 * fem, 79 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupyznt9wT (TtqPWLiURqBhA9fc4kYZnT)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 39.5 * fem, 47 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // logoTBT (405:174)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 13 * fem, 1 * fem),
                      width: 51 * fem,
                      height: 50 * fem,
                      child: Image.asset(
                        'assets/page-1/images/logo-v77.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      // importreelsMXj (405:173)
                      'Import Reels',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 35 * ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.26 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // textU6Z (405:175)
                margin:
                    EdgeInsets.fromLTRB(21.5 * fem, 0 * fem, 0 * fem, 82 * fem),
                constraints: BoxConstraints(
                  maxWidth: 291 * fem,
                ),
                child: Text(
                  'AUTO-MATCH uses your Instagram to match you with people who have the same humor as you',
                  textAlign: TextAlign.center,
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 24 * ffem,
                    fontWeight: FontWeight.w300,
                    height: 1.26 * ffem / fem,
                    color: Color(0xff2c2c2c),
                  ),
                ),
              ),
              Container(
                // emailinputYcD (405:166)
                margin: EdgeInsets.fromLTRB(
                    16.47 * fem, 0 * fem, 6.03 * fem, 43 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xfff4f3f3),
                ),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        23.03 * fem, 17 * fem, 23.03 * fem, 15 * fem),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Color(0xffa4a4a4)),
                  ),
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 19 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.26 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // passwordinputMpZ (405:169)
                margin:
                    EdgeInsets.fromLTRB(15 * fem, 0 * fem, 7.5 * fem, 62 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xfff4f3f3),
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
                        24 * fem, 15 * fem, 24 * fem, 17 * fem),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Color(0xffa4a4a4)),
                  ),
                  style: SafeGoogleFont(
                    'Plus Jakarta Sans',
                    fontSize: 19 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.26 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                // signinbuttonPFT (405:163)
                margin:
                    EdgeInsets.fromLTRB(16 * fem, 0 * fem, 6.5 * fem, 40 * fem),
                child: TextButton(
                  onPressed: () {
                    submitReels();
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
                        'Continue ',
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
                // signinbuttonPem (405:177)
                margin:
                    EdgeInsets.fromLTRB(15 * fem, 0 * fem, 7.5 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up_songs');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 71 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Plus Jakarta Sans',
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.26 * ffem / fem,
                          color: Color(0xff2c2c2c),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    ));
  }
}
