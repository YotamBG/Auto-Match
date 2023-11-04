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
      fetchResponse =
          await api.dio.get('${dotenv.env["SERVER_URL"]}/match-fetch-all');
    }
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
              'music': match['music_match_percent'],
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
    return Scaffold(
      backgroundColor: const Color(0xfffaf4ef),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: usersList.length,
            itemBuilder: (context, index) {
              final user = usersList[index];

              return GestureDetector(
                onTap: () {
                  print('clicked user ${user['id']}!');
                  Navigator.pushNamed(context, '/match', arguments: user['id']);
                },
                child: Card(
                  margin: const EdgeInsets.all(30),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  user['image_url'],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.contain,
                                )),
                            Text(
                              user['name'].toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Face score: ${user['stats']['face'].toString()}%',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Music score: ${user['stats']['music'].toString()}%',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Reels score: ${user['stats']['reels'].toString()}%',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const MyButtonBar()
        ],
      ),
    );
  }
}
