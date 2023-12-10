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
        body: SingleChildScrollView(
            child: SizedBox(
      width: double.infinity,
      child: candidateUser == null
          ? Container()
          : Container(
              padding: EdgeInsets.fromLTRB(
                  11.5 * fem, 23.33 * fem, 11.5 * fem, 10 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xfffaf4ef),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 311 * fem, 63.33 * fem),
                    width: 24 * fem,
                    height: 18.33 * fem,
                    child: Image.asset(
                      'assets/page-1/images/back-arrow-RbP.png',
                      width: 24 * fem,
                      height: 18.33 * fem,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        82.5 * fem, 0 * fem, 81.5 * fem, 22 * fem),
                    width: double.infinity,
                    height: 70 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 188 * fem,
                              height: 54 * fem,
                              child: Text(
                                candidateUser != null
                                    ? '${candidateUser['name']}, ${candidateUser['age']}'
                                    : '',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Playfair Display',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w800,
                                  height: 1.3325 * ffem / fem,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 41.5 * fem,
                          top: 43 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 104 * fem,
                              height: 27 * fem,
                              child: Text(
                                candidateUser != null
                                    ? '${candidateUser['location']}'
                                    : '',
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        80.5 * fem, 0 * fem, 77.5 * fem, 32 * fem),
                    width: double.infinity,
                    height: 195 * fem,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: candidateUser != null
                            ? Image.network(
                                '${dotenv.env["SERVER_URL"]}/pic/${candidateUser['id']}/profilePic.png',
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              )
                            : Container()),
                  ),
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
                                  Container(
                                    height: 100.0 *
                                        (matchData['songs_match_percent'] /
                                            100.0),
                                    width: 30,
                                    color: Color.fromARGB(255, 104, 76, 175),
                                  ),
                                  SizedBox(height: 4),
                                  Text('Songs'),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 100.0 *
                                        (matchData['face_match_percent'] /
                                            100.0),
                                    width: 30,
                                    color:
                                        const Color.fromARGB(255, 175, 76, 152),
                                  ),
                                  SizedBox(height: 4),
                                  Text('Face'),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 100.0 *
                                        (matchData['reels_match_percent'] /
                                            100.0),
                                    width: 30,
                                    color: Color.fromARGB(255, 175, 76, 116),
                                  ),
                                  SizedBox(height: 4),
                                  Text('Reels'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 214 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 13 * fem),
                          width: double.infinity,
                          child: Text(
                            candidateUser != null
                                ? '${candidateUser['name']}’s Bio'
                                : '',
                            textAlign: TextAlign.start,
                            style: SafeGoogleFont(
                              'Playfair Display',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w800,
                              height: 1.3325 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 13 * fem),
                          width: double.infinity,
                          child: Text(
                            candidateUser != null
                                ? '${candidateUser['bio']}'
                                : '',
                            textAlign: TextAlign.start,
                            style: SafeGoogleFont(
                              'Playfair Display',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3325 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
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
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        CarouselSlider(
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
                                    data:
                                        '<iframe src="$reel/embed/" ></iframe>',
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
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
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
                                color: const Color(0xff000000),
                              ),
                            ),
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 362,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                              // viewportFraction: 0.7
                            ),
                            items:
                                matchData['common_songs'].map<Widget>((song) {
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
                        ]),
                  ),
                ],
              ),
            ),
    )));
  }
}
