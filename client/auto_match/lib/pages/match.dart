import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Match extends StatefulWidget {
  const Match({super.key});

  @override
  State<Match> createState() => _MatchState();
}

class _MatchState extends State<Match> {
  var candidateUser;
  var matchData;

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
      // get both users
      final candidateUserId = ModalRoute.of(context)!.settings.arguments as int;
      final candidateUserObject = await profileReq(candidateUserId);
      final currentUserObject = await profileReq();

      //get and save match between the users
      var matchResponse = await api.dio.get(
          '${dotenv.env["SERVER_URL"]}/get-match/${currentUserObject['id']}/$candidateUserId');
      setState(() {
        matchData = matchResponse.data;
      });
      setState(() {
        candidateUser = candidateUserObject;
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
        body: SafeArea(
          child: SingleChildScrollView(
              child: SizedBox(
              width: double.infinity,
              child: candidateUser == null
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroup7tcfN6q (TtqTuYiZurDK781Gfv7TCF)
                    margin: EdgeInsets.fromLTRB(
                        30.5 * fem, 30 * fem, 168 * fem, 22 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // logoHDo (405:118)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 16.5 * fem, 0 * fem),
                          width: 51 * fem,
                          height: 50 * fem,
                          child: Image.asset(
                            'assets/page-1/images/logo-MdX.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          // matchoC9 (405:103)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 2 * fem),
                          child: Text(
                            'Match',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Plus Jakarta Sans',
                              fontSize: 30 * ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.26 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // text7Cq (405:110)
                    margin: EdgeInsets.fromLTRB(
                        7.48 * fem, 0 * fem, 0 * fem, 1 * fem),
                    child: Text(
                      '${candidateUser['name']}',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 35 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.26 * ffem / fem,
                        color: Color(0xff2c2c2c),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 55 * fem,
                    height: 22 * fem,
                    child: Text(
                      '${candidateUser['age']}, ${candidateUser['location']}',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 17 * ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.26 * ffem / fem,
                        color: Color.fromARGB(255, 94, 49, 49),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 259.12 * fem,
                    height: 283.24 * fem,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20 * fem),
                      child: Image.network(
                        '${dotenv.env["SERVER_URL"]}/pic/${candidateUser['id']}/profilePic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                      '${matchData['face_match_percent'].toStringAsFixed(0)}%'),
                                  Container(
                                    height: 100.0 *
                                        (matchData['face_match_percent'] / 100.0),
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            HSLColor.fromAHSL(1, 176, 0.84, 0.30)
                                                .toColor(),
                                            HSLColor.fromAHSL(
                                                    1,
                                                    176,
                                                    0.84,
                                                    0.01 *
                                                        (30 +
                                                            (70 - 30) *
                                                                matchData[
                                                                    'face_match_percent'] *
                                                                0.01))
                                                .toColor(),
                                          ],
                                        )),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '👀',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'AppleEmoji'),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                      '${matchData['reels_match_percent'].toStringAsFixed(0)}%'),
                                  Container(
                                    height: 100.0 *
                                        (matchData['reels_match_percent'] /
                                            100.0),
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            HSLColor.fromAHSL(1, 162, 0.88, 0.30)
                                                .toColor(),
                                            HSLColor.fromAHSL(
                                                    1,
                                                    162,
                                                    0.88,
                                                    0.01 *
                                                        (30 +
                                                            (70 - 30) *
                                                                matchData[
                                                                    'reels_match_percent'] *
                                                                0.01))
                                                .toColor(),
                                          ],
                                        )),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '😂',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'AppleEmoji'),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                      '${matchData['songs_match_percent'].toStringAsFixed(0)}%'),
                                  Container(
                                    height: 100.0 *
                                        (matchData['songs_match_percent'] /
                                            100.0),
                                    width: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            HSLColor.fromAHSL(1, 202, 0.94, 0.30)
                                                .toColor(),
                                            HSLColor.fromAHSL(
                                                    1,
                                                    202,
                                                    0.94,
                                                    0.01 *
                                                        (30 +
                                                            (70 - 30) *
                                                                matchData[
                                                                    'songs_match_percent'] *
                                                                0.01))
                                                .toColor(),
                                          ],
                                        )),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '🎵',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'AppleEmoji'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // textipD (405:139)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 286.52 * fem, 8 * fem),
                    child: Text(
                      'Bio',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 25 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.26 * ffem / fem,
                        color: Color(0xff2c2c2c),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 30),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        '${candidateUser['bio']}',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Plus Jakarta Sans',
                          fontSize: 17 * ffem,
                          fontWeight: FontWeight.w300,
                          height: 1.26 * ffem / fem,
                          color: Color(0xff2c2c2c),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // textAw7 (405:141)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 159 * fem, 0 * fem),
                    child: Text(
                      'Common reels',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 25 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.26 * ffem / fem,
                        color: Color(0xff2c2c2c),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: 300,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: true,
                          viewportFraction: 0.7),
                      items: matchData['common_reels'].map<Widget>((reel) {
                        return Stack(
                          children: [
                            Expanded(
                              child: Html(
                                data: '<iframe src="$reel/embed/" ></iframe>',
                                style: {
                                  'iframe': Style(
                                    height: Height(300),
                                  ),
                                },
                                extensions: const [IframeHtmlExtension()],
                                shrinkWrap: true,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    // textAw7 (405:141)
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 159 * fem, 0 * fem),
                    child: Text(
                      'Common songs',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Plus Jakarta Sans',
                        fontSize: 25 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.26 * ffem / fem,
                        color: Color(0xff2c2c2c),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 362,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        // viewportFraction: 0.7
                      ),
                      items: matchData['common_songs'].map<Widget>((song) {
                        return Stack(
                          children: [
                            Expanded(
                              child: Html(
                                data:
                                    '<iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/$song?utm_source=generator&theme=0" width="50%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>',
                                extensions: const [IframeHtmlExtension()],
                                shrinkWrap: true,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )),
        ));
  }
}
