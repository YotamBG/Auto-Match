import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/services/api.dart';
import 'package:myapp/pages/services/auth.dart';
import 'package:myapp/utils.dart';

import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:carousel_slider/carousel_slider.dart';

class new_match extends StatefulWidget {
  @override
  State<new_match> createState() => _new_matchState();
}

class _new_matchState extends State<new_match> {
  var userOb;
  var myUserName;
  var matchData;
  final url = 'http://10.0.2.2:5000';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadUserProfile();
  }

  // Function to load the user profile
  Future<void> loadUserProfile() async {
    try {
      final userId = ModalRoute.of(context)!.settings.arguments as int;
      print('userId');
      print(userId);
      final user = await profileReq(userId);

      final myuser = await profileReq();
      setState(() {
        myUserName = myuser['name'];
      });

      var response =
          await api.dio.get('$url/get_match/${myuser['id']}/${userId}');
      final responseBody = response.data.toString();
      print(responseBody);
      setState(() {
        matchData = response.data;
      });
      print('matchData:');
      print(matchData);
      setState(() {
        userOb = user;
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
            child: Container(
      width: double.infinity,
      child: userOb == null
                      ? Container()
                      : Container(
        // newmatchNqo (120:145)
        padding:
            EdgeInsets.fromLTRB(11.5 * fem, 23.33 * fem, 11.5 * fem, 10 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfffaf4ef),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // backarrowVQd (165:21)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 311 * fem, 63.33 * fem),
              width: 24 * fem,
              height: 18.33 * fem,
              child: Image.asset(
                'assets/page-1/images/back-arrow-RbP.png',
                width: 24 * fem,
                height: 18.33 * fem,
              ),
            ),
            Container(
              // autogrouphqrucEM (Nr6kizJTHkrY2TQRtZHQRu)
              margin: EdgeInsets.fromLTRB(
                  82.5 * fem, 0 * fem, 81.5 * fem, 22 * fem),
              width: double.infinity,
              height: 70 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // nameageY81 (127:163)
                    left: 0 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 188 * fem,
                        height: 54 * fem,
                        child: Text(
                          userOb != null
                              ? '${userOb['name']}, ${userOb['age']}'
                              : '',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Playfair Display',
                            fontSize: 40 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.3325 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // kmaway2os (127:173)
                    left: 41.5 * fem,
                    top: 43 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 104 * fem,
                        height: 27 * fem,
                        child: Text(
                          userOb != null ? '${userOb['location']}' : '',
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
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // photosv8Z (127:164)
              margin: EdgeInsets.fromLTRB(
                  80.5 * fem, 0 * fem, 77.5 * fem, 32 * fem),
              width: double.infinity,
              height: 195 * fem,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: userOb != null
                      ? Image.network(
                          '$url/pic/${userOb['id']}/profilePic.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : Container()),
            ),
            Container(
              // scoringpolesT8V (137:14)
              margin: EdgeInsets.fromLTRB(
                  124.5 * fem, 0 * fem, 123.5 * fem, 40 * fem),
              width: double.infinity,
              height: 103 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // rectangle10yMj (127:165)
                    width: 30 * fem,
                    height: 103 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffd9d9d9),
                    ),
                  ),
                  Container(
                    // autogrouphw9vBTo (Nr6mrxQY3C7BwS4q3VhW9V)
                    padding: EdgeInsets.fromLTRB(
                        7 * fem, 19 * fem, 0 * fem, 0 * fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // rectangle11ueh (127:166)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 7 * fem, 0 * fem),
                          width: 30 * fem,
                          height: 69 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffd9d9d9),
                          ),
                        ),
                        Container(
                          // rectangle12qoF (127:169)
                          width: 30 * fem,
                          height: 84 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffd9d9d9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // biobGd (137:13)
              // margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
              width: 214 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // danielsbioXRB (127:170)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 13 * fem),
                    width: double.infinity,
                    child: Text(
                      userOb != null ? '${userOb['name']}’s Bio' : '',
                      textAlign: TextAlign.start,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // lookingforsomeonetocookwithchX (127:171)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 13 * fem),
                    width: double.infinity,
                    child: Text(
                      userOb != null ? '${userOb['bio']}' : '',
                      textAlign: TextAlign.start,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // biobGd (137:13)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
              // width: 214 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // danielsbioXRB (127:170)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 13 * fem),
                    width: double.infinity,
                    child: Text(
                      'Common Reels',
                      textAlign: TextAlign.start,
                      style: SafeGoogleFont(
                        'Playfair Display',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w800,
                        height: 1.3325 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 300, // Set the desired height here
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7),
                    items: matchData['common_reels'].map<Widget>((reel) {
                      return Stack(
                        children: [
                          // Display the image
                          Expanded(
                            child: Html(
                              data: '<iframe src="$reel/embed/" ></iframe>',
                              style: {
                                'iframe': Style(
                                  height: Height(
                                      300), // Set the desired height here
                                ),
                              },
                              extensions: [IframeHtmlExtension()],
                              shrinkWrap: true,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              // biobGd (137:13)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
              // width: 214 * fem,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // danielsbioXRB (127:170)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 13 * fem),
                      width: double.infinity,
                      child: Text(
                        'Common Songs',
                        textAlign: TextAlign.start,
                        style: SafeGoogleFont(
                          'Playfair Display',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.3325 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 362, // Set the desired height here
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          // viewportFraction: 0.7
                          ),
                      items: matchData['common_songs'].map<Widget>((song) {
                        return Stack(
                          children: [
                            // Display the image
                            Expanded(
                              child: Html(
                                data: '<iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/$song?utm_source=generator&theme=0" width="50%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>',
                                // style: {
                                //   'iframe': Style(
                                //     height: Height(
                                //         352), // Set the desired height here
                                //   ),
                                // },
                                extensions: [IframeHtmlExtension()],
                                shrinkWrap: true,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ]),
            ),
            Container(
              // autogroup1mc3Kds (Nr6koa19tzh5fAPsfV1Mc3)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 35.63 * fem, 0 * fem),
              width: 315.37 * fem,
              height: 128 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // iconbareg9 (120:147)
                    left: 36 * fem,
                    top: 48 * fem,
                    child: Container(
                      width: 279.37 * fem,
                      height: 80 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // iconmessagecircleoutlineZo7 (120:156)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 4.37 * fem, 52.63 * fem, 0 * fem),
                            width: 52.37 * fem,
                            height: 52.37 * fem,
                            child: Image.asset(
                              'assets/page-1/images/icon-message-circle-outline-gpq.png',
                              width: 52.37 * fem,
                              height: 52.37 * fem,
                            ),
                          ),
                          Container(
                            // iconheart4js (120:148)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 42 * fem, 0 * fem),
                            width: 80 * fem,
                            height: 80 * fem,
                            child: Image.asset(
                              'assets/page-1/images/icon-heart.png',
                              width: 80 * fem,
                              height: 80 * fem,
                            ),
                          ),
                          Container(
                            // iconpersonaTK (120:151)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 15 * fem, 0 * fem, 12.63 * fem),
                            padding: EdgeInsets.fromLTRB(10.91 * fem,
                                6.55 * fem, 10.91 * fem, 6.55 * fem),
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0x00ffffff),
                            ),
                            child: Center(
                              // group5ey (120:153)
                              child: SizedBox(
                                width: 30.55 * fem,
                                height: 39.27 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/group-jGM.png',
                                  width: 30.55 * fem,
                                  height: 39.27 * fem,
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
          ],
        ),
      ),
    )));
  }
}
