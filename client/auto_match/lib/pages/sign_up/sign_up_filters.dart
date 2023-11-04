import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';

class Sign_up_filters extends StatefulWidget {
  const Sign_up_filters({super.key});

  @override
  State<Sign_up_filters> createState() => _Sign_up_filtersState();
}

class _Sign_up_filtersState extends State<Sign_up_filters> {
  int? _selectedLooksButtonIndex = -1;
  int? _selectedMusicButtonIndex = -1;
  int? _selectedReelsButtonIndex = -1;

  void _handleLooksButtonSelected(int? index) {
    setState(() {
      _selectedLooksButtonIndex = index;
    });
    print('Looks: $_selectedLooksButtonIndex');
  }

  void _handleMusicButtonSelected(int? index) {
    setState(() {
      _selectedMusicButtonIndex = index;
    });
    print('Music: $_selectedMusicButtonIndex');
  }

  void _handleReelsButtonSelected(int? index) {
    setState(() {
      _selectedReelsButtonIndex = index;
    });
    print('Reels: $_selectedReelsButtonIndex');
  }

  Future<void> submitFilters() async {
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

    print('Looks: $_selectedLooksButtonIndex');
    print('Music: $_selectedMusicButtonIndex');
    print('Reels: $_selectedReelsButtonIndex');

    // send req to server
    print('Sending req to server...');
    final jsonData = {
      "filters": {
        "face": _selectedLooksButtonIndex,
        "songs": _selectedMusicButtonIndex,
        "reels": _selectedReelsButtonIndex,
      }
    };
    print('jsonData:');
    print(jsonData);

    final musicReq = await api.dio.put(
      '${dotenv.env["SERVER_URL"]}/profile/update',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    final filtersReqResponse = musicReq.data.toString();
    print('Server Response: $filtersReqResponse');

    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    Navigator.pushNamed(context, '/sign_up_pic');
  }

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
        padding: EdgeInsets.fromLTRB(31 * fem, 35 * fem, 24 * fem, 72 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 14 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-j2R.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(21 * fem, 20.33 * fem, 26 * fem, 0 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 25.33 * fem),
                    width: 24 * fem,
                    height: 18.33 * fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-5Wy.png',
                      width: 24 * fem,
                      height: 18.33 * fem,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 5 * fem),
                    width: double.infinity,
                    child: Text(
                      'SIGN UP',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 28 * fem),
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxWidth: 269 * fem,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: SafeGoogleFont(
                          'Playfair Display',
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.3325 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          const TextSpan(
                            text: 'Whats important to you?\n',
                          ),
                          TextSpan(
                            text:
                                'You can change it\n anytime in ‘app settings’',
                            style: SafeGoogleFont(
                              'Playfair Display',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.3325 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 300 * fem,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 238 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    8.24 * fem, 0 * fem, 0 * fem, 2 * fem),
                                child: Text(
                                  'Looks',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Playfair Display',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3325 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleLooksButtonSelected(0);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedLooksButtonIndex == 0
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Neutral',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleLooksButtonSelected(1);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedLooksButtonIndex == 1
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Bonus',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleLooksButtonSelected(2);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedLooksButtonIndex == 2
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Must',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 238 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    8.24 * fem, 0 * fem, 0 * fem, 2 * fem),
                                child: Text(
                                  'Music',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Playfair Display',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3325 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleMusicButtonSelected(0);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedMusicButtonIndex == 0
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Neutral',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleMusicButtonSelected(1);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedMusicButtonIndex == 1
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Bonus',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleMusicButtonSelected(2);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedMusicButtonIndex == 2
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Must',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 238 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    8.24 * fem, 0 * fem, 0 * fem, 2 * fem),
                                child: Text(
                                  'Reels',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Playfair Display',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3325 * ffem / fem,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleReelsButtonSelected(0);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedReelsButtonIndex == 0
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Neutral',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleReelsButtonSelected(1);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedReelsButtonIndex == 1
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Bonus',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleReelsButtonSelected(2);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(10.0),
                                        backgroundColor:
                                            _selectedReelsButtonIndex == 2
                                                ? const Color(0xffd9d9d9)
                                                : Colors.white,
                                      ),
                                      child: const Text(
                                        'Must',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              39 * fem, 0 * fem, 21 * fem, 19 * fem),
                          child: TextButton(
                            onPressed: () {
                              submitFilters();
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
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
