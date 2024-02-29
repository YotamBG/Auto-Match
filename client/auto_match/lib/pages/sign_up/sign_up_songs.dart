import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';

class Sign_up_songs extends StatefulWidget {
  const Sign_up_songs({super.key});

  @override
  State<Sign_up_songs> createState() => _Sign_up_songsState();
}

class _Sign_up_songsState extends State<Sign_up_songs> {
  final TextEditingController _playlistController = TextEditingController();

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

  Future<void> submitSongs() async {
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

    final String playlistURL = _playlistController.text;
    print(playlistURL);

    // send req to server
    print('Sending req to server...');
    final jsonData = {
      "songs": playlistURL,
    };
    print('jsonData:');
    print(jsonData);

    try {
      final songsReq = await api.dio.post(
        '${dotenv.env["SERVER_URL"]}/submit-songs',
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode(jsonData),
      );

      final songsReqResponse = songsReq.data.toString();
      print('Server Response: $songsReqResponse');
      //hide loading
      Navigator.of(context).pop();
      //move to the next screeen
      if (pop == true) {
        Navigator.pushNamed(context, '/matches');
      } else {
        Navigator.pushNamed(context, '/sign_up_filters');
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
                    Navigator.pushNamed(context, '/sign_up_filters');
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
          // signup39Dw (405:195)
          padding:
              EdgeInsets.fromLTRB(26 * fem, 33 * fem, 42.53 * fem, 79 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogrouppfddEWH (TtqQ1ADncc3tSzjVV1pfDD)
                margin: EdgeInsets.fromLTRB(
                    0 * fem, 0 * fem, 20.47 * fem, 80 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // logokzR (405:210)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 10 * fem, 1 * fem),
                      width: 51 * fem,
                      height: 50 * fem,
                      child: Image.asset(
                        'assets/page-1/images/logo-4p5.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      // importsongsgdB (405:208)
                      'Import Songs',
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
                // textDND (405:209)
                margin: EdgeInsets.fromLTRB(
                    13.53 * fem, 0 * fem, 0 * fem, 88 * fem),
                constraints: BoxConstraints(
                  maxWidth: 290 * fem,
                ),
                child: Text(
                  'AUTO-MATCH uses your Spotify to match you with people who have the same songs as you',
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
                // emailinputX81 (405:202)
                margin: EdgeInsets.fromLTRB(
                    16.47 * fem, 0 * fem, 0 * fem, 122 * fem),
                width: 290 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color(0xfff4f3f3),
                ),
                child: TextField(
                  controller: _playlistController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(
                        22.53 * fem, 17 * fem, 22.53 * fem, 15 * fem),
                    hintText: 'Playlist URL',
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
                // signinbuttonLbF (405:196)
                margin: EdgeInsets.fromLTRB(
                    15.53 * fem, 0 * fem, 0 * fem, 40 * fem),
                child: TextButton(
                  onPressed: () {
                    submitSongs();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 290 * fem,
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
                // signinbuttonAaH (405:199)
                margin:
                    EdgeInsets.fromLTRB(13.53 * fem, 0 * fem, 0 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up_filters');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: 290 * fem,
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
