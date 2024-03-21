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
  int? _selectedLooksButtonIndex = 1;
  int? _selectedSongsButtonIndex = 1;
  int? _selectedReelsButtonIndex = 1;

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

  void _handleLooksButtonSelected(int? index) {
    setState(() {
      _selectedLooksButtonIndex = index;
    });
    print('Looks: $_selectedLooksButtonIndex');
  }

  void _handleSongsButtonSelected(int? index) {
    setState(() {
      _selectedSongsButtonIndex = index;
    });
    print('Songs: $_selectedSongsButtonIndex');
  }

  void _handleReelsButtonSelected(int? index) {
    setState(() {
      _selectedReelsButtonIndex = index;
    });
    print('Reels: $_selectedReelsButtonIndex');
  }

  Future<void> submitFilters() async {
    //show loading
    loading(context);

    print('Looks: $_selectedLooksButtonIndex');
    print('Songs: $_selectedSongsButtonIndex');
    print('Reels: $_selectedReelsButtonIndex');

    // send req to server
    print('Sending req to server...');
    final jsonData = {
      "face_filter_weight": _selectedLooksButtonIndex,
      "songs_filter_weight": _selectedSongsButtonIndex,
      "reels_filter_weight": _selectedReelsButtonIndex
    };
    print('jsonData:');
    print(jsonData);

    final songsReq = await api.dio.put(
      '${dotenv.env["SERVER_URL"]}/profile/update',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    final filtersReqResponse = songsReq.data.toString();
    print('Server Response: $filtersReqResponse');

    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    if (pop == true) {
      Navigator.pushNamed(context, '/matches');
    } else {
      Navigator.pushNamed(context, '/sign_up_memo', arguments: {'memoNum': 5});
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
          // signup4Px1 (405:211)
          padding: EdgeInsets.fromLTRB(20 * fem, 33 * fem, 21 * fem, 79 * fem),
          width: double.infinity,
          // height: double.infinity
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupbvmrgRK (TtqRrGoyYjDmTvN4gkBvMR)
                margin:
                    EdgeInsets.fromLTRB(4 * fem, 0 * fem, 0 * fem, 38 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // logookq (405:223)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 8 * fem, 1 * fem),
                      width: 51 * fem,
                      height: 50 * fem,
                      child: Image.asset(
                        'assets/page-1/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      // setpreferences8o7 (405:221)
                      'Set Preferences',
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
                // text4wf (405:222)
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 38 * fem),
                constraints: BoxConstraints(
                  maxWidth: 259 * fem,
                ),
                child: Text(
                  'Specify which qualities are most important to you',
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
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300* fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // textaQD (405:224)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 20 * fem, 0 * fem, 20 * fem),
                            child: Text(
                              'Looks',
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
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _handleLooksButtonSelected(1);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedLooksButtonIndex == 1
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Neutral',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _handleLooksButtonSelected(2);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedLooksButtonIndex == 2
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Bonus',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _handleLooksButtonSelected(3);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedLooksButtonIndex == 3
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Must',
                                    style: TextStyle(
                                      fontSize: 14,
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
                      width: 300* fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // textaQD (405:224)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 20 * fem, 0 * fem, 20 * fem),
                            child: Text(
                              'Songs',
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
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _handleSongsButtonSelected(1);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedSongsButtonIndex == 1
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Neutral',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _handleSongsButtonSelected(2);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedSongsButtonIndex == 2
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Bonus',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _handleSongsButtonSelected(3);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedSongsButtonIndex == 3
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Must',
                                    style: TextStyle(
                                      fontSize: 14,
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
                      width: 300* fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // textqgq (405:251)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 20 * fem, 0 * fem, 20 * fem),
                            child: Text(
                              'Humor',
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
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    _handleReelsButtonSelected(1);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedReelsButtonIndex == 1
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Neutral',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _handleReelsButtonSelected(2);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedReelsButtonIndex == 2
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Bonus',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _handleReelsButtonSelected(3);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10*fem),
                                    backgroundColor:
                                        _selectedReelsButtonIndex == 3
                                            ? const Color(0xffd9d9d9)
                                            : Colors.white,
                                  ),
                                  child: const Text(
                                    'Must',
                                    style: TextStyle(
                                      fontSize: 14,
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
                    SizedBox(height: 70),
                    Container(
                      // signinbuttonDUR (405:212)
                      margin: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 20 * fem, 20 * fem),
                      child: TextButton(
                        onPressed: () {
                          submitFilters();
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
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    ));
  }
}
