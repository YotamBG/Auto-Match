import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/services/api.dart';
import 'package:myapp/utils.dart';

class sign_up_process_7 extends StatefulWidget {
  @override
  State<sign_up_process_7> createState() => _sign_up_process_7State();
}

class _sign_up_process_7State extends State<sign_up_process_7> {
  // final TextEditingController _playlistController = TextEditingController();
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
      'http://10.0.2.2:5000/profile/update',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    final filtersReqResponse = musicReq.data.toString();
    print('Server Response: ${filtersReqResponse}');

    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    Navigator.pushNamed(context, '/signup8');
  }

//   {
//   "reels": 0,
//   "songs": 1,
//   "face": 2
// }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      child: Container(
        // signupprocess7P9s (114:114)
        padding: EdgeInsets.fromLTRB(31 * fem, 35 * fem, 24 * fem, 72 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logoUh7 (140:139)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6 * fem, 14 * fem),
              width: 210 * fem,
              height: 124 * fem,
              child: Image.asset(
                'assets/page-1/images/logo-j2R.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // signupCt1 (114:115)
              padding:
                  EdgeInsets.fromLTRB(21 * fem, 20.33 * fem, 26 * fem, 0 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // backarrow6yP (114:122)
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
                    // signupQjB (114:117)
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
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // imlookingfora7db (114:139)
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
                          color: Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
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
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // autogroupdstmEk9 (Nr6g5TNtzp1W2UUeVodsTM)
                    // margin: EdgeInsets.fromLTRB(
                    //     11.5 * fem, 0 * fem, 5 * fem, 42 * fem),
                    width: double.infinity,
                    height: 300 * fem,
                    child: Column(
                      children: [
                        Container(
                          width: 238 * fem,
                          // height: 48 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // femaleyr9 (114:138)
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
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // group6HM3 (155:69)
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
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedLooksButtonIndex ==
                                                0
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Neutral',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleLooksButtonSelected(1);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedLooksButtonIndex ==
                                                1
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Bonus',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleLooksButtonSelected(2);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedLooksButtonIndex ==
                                                2
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Must',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
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
                          width: 238 * fem,
                          // height: 48 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // femaleyr9 (114:138)
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
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // group6HM3 (155:69)
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
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedMusicButtonIndex ==
                                                0
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Neutral',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleMusicButtonSelected(1);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedMusicButtonIndex ==
                                                1
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Bonus',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleMusicButtonSelected(2);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedMusicButtonIndex ==
                                                2
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Must',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
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
                          width: 238 * fem,
                          // height: 48 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // femaleyr9 (114:138)
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
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // group6HM3 (155:69)
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
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedReelsButtonIndex ==
                                                0
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Neutral',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleReelsButtonSelected(1);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedReelsButtonIndex ==
                                                1
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Bonus',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _handleReelsButtonSelected(2);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(
                                            10.0), // Adjust the padding as needed
                                        backgroundColor: _selectedReelsButtonIndex ==
                                                2
                                            ? Color(
                                                0xffd9d9d9) // Change the color for the selected button
                                            : Colors
                                                .white, // Change the color for unselected buttons
                                      ),
                                      child: Text(
                                        'Must',
                                        style: TextStyle(
                                          fontSize:
                                              16.0, // Adjust the font size as needed
                                          color: Colors.black, // Text color
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
                          // autogroupawjh48H (Nr6fgdhbF5STTMUFYiaWjH)
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
                                color: Color(0xffdee5ed),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff000000),
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
                                    color: Color(0xff000000),
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
