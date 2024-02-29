import 'package:AUTO_MATCH/pages/services/utils.dart';
import 'package:AUTO_MATCH/pages/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:AUTO_MATCH/pages/button_bar.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  List<Map<String, dynamic>> usersList = [];
  List<bool> selectedFilters = [false, false, false];

  @override
  void initState() {
    super.initState();
    // Fetch user data from the backend API
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    // get matches
    var fetchResponse =
        await api.dio.get('${dotenv.env["SERVER_URL"]}/match-fetch-all');
    print(fetchResponse.data['matches']);

    // check if there are any matches
    if (fetchResponse.data['matches'].length == 0) {
      print('empty!');
      // generate macthes in case none are available
      var searchResponse = await api.dio.post(
          '${dotenv.env["SERVER_URL"]}/match-search-all'); // copy to refresh button
      print(searchResponse);
      // get the newly generated matches
    }
    fetchResponse =
        await api.dio.get('${dotenv.env["SERVER_URL"]}/match-fetch');
    final responseBody = fetchResponse.data.toString();

    if (fetchResponse.statusCode == 200) {
      // Parse the JSON response
      final jsonData = fetchResponse.data;
      print(jsonData);
      setState(() {
        usersList = (jsonData['matches'] as List<dynamic>).map((match) {
          return {
            'id': match['candidate_user_id'],
            'name': match['candidate_user_name'],
            'image_url':
                '${dotenv.env["SERVER_URL"]}/pic/${match['candidate_user_id']}/profilePic.png',
            'stats': {
              'face': match['face_match_percent'],
              'songs': match['songs_match_percent'],
              'reels': match['reels_match_percent'],
            }
          };
        }).toList();
      });
    } else {
      // Handle error when fetching data
      print('Error fetching user data: ${fetchResponse.statusCode}');
      print(responseBody);
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyTopBar('Matches'),
            Expanded(
              child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  final user = usersList[index];

                  return GestureDetector(
                    onTap: () {
                      print('clicked user ${user['id']}!');
                      Navigator.pushNamed(context, '/match',
                          arguments: user['id']);
                    },
                    child: Center(
                      child: Container(
                        // card1Fj (403:53)
                        margin: EdgeInsets.fromLTRB(
                            11 * fem, 0 * fem, 0 * fem, 53.67 * fem),
                        child: Container(
                          width: 303 * fem,
                          height: 415.33 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20 * fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle5mP (403:54)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 303 * fem,
                                    height: 410.28 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20 * fem),
                                        color: Color(0xffffffff),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x3f000000),
                                            offset: Offset(0 * fem, 4 * fem),
                                            blurRadius: 2 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 259.12 * fem,
                                      height: 283.24 * fem,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20 * fem),
                                        child: Image.network(
                                          user['image_url'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80 * fem,
                                      height: 36 * fem,
                                      child: Text(
                                        user['name'].toString(),
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Plus Jakarta Sans',
                                          fontSize: 28 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.26 * ffem / fem,
                                          color: Color(0xff2c2c2c),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '${user['stats']['face'].toStringAsFixed(0)}%',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Plus Jakarta Sans',
                                                  fontSize: 20 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.26 * ffem / fem,
                                                  color: Color(0xff2c2c2c),
                                                ),
                                              ),
                                              Text(
                                                '👀',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20 * ffem,
                                                    fontFamily: 'AppleEmoji'),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '${user['stats']['reels'].toStringAsFixed(0)}%',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Plus Jakarta Sans',
                                                  fontSize: 20 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.26 * ffem / fem,
                                                  color: Color(0xff2c2c2c),
                                                ),
                                              ),
                                              Text(
                                                '😂',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20 * ffem,
                                                    fontFamily: 'AppleEmoji'),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '${user['stats']['songs'].toStringAsFixed(0)}%',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Plus Jakarta Sans',
                                                  fontSize: 20 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.26 * ffem / fem,
                                                  color: Color(0xff2c2c2c),
                                                ),
                                              ),
                                              Text(
                                                '🎵',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20 * ffem,
                                                    fontFamily: 'AppleEmoji'),
                                              )
                                            ],
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
                      ),
                    ),
                  );
                },
              ),
            ),
            MyButtonBar('matches')
          ],
        ),
      ),
    );
  }
}
