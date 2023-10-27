import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/buttonBar.dart';
import 'package:myapp/pages/services/api.dart';
import 'package:myapp/utils.dart';

// Now you can use the 'html' widget in your Flutter app.

class matches extends StatefulWidget {
  @override
  State<matches> createState() => _matchesState();
}

class _matchesState extends State<matches> {
  List<Map<String, dynamic>> usersList = [];
  List<bool> selectedFilters = [false, false, false]; // Initial filter states

  @override
  void initState() {
    super.initState();
    // Fetch user data from the backend API
    fetchUserData();
  }

  void sendDataToServer() async {
    print('Sending req to server...');
  }

  Future<void> fetchUserData() async {
    final url = 'http://10.0.2.2:5000';
    // final filters = ['face', 'music', 'reels']; // Filters to apply

    // Build the filter query parameter based on selected toggles
    // final selectedFilterNames = selectedFilters
    //     .asMap()
    //     .entries
    //     .where((entry) => entry.value)
    //     .map((entry) => filters[entry.key])
    //     .toList();

    // final filterQueryParam = selectedFilterNames.isNotEmpty
    //     ? 'filters=${selectedFilterNames.join(',')}'
    //     : '';

    var response = await api.dio.get('$url/match-fetch-all');
    // final response = await api.dio.get('$url/match-fetch');

    print(response.data['matches']);
    if (response.data['matches'].length == 0) {
      print('empty!');
      var response2 = await api.dio.post(
          '$url/match-search-all'); // move to button, instiate automatically if match-fetch is empty
      response = await api.dio.get('$url/match-fetch-all');
    }
    final responseBody = response.data.toString();
    if (response.statusCode == 200) {
      // Parse the JSON response
      final jsonData = response.data;
      print(jsonData);
      setState(() {
        usersList = (jsonData['matches'] as List<dynamic>).map((match) {
          return {
            'id': match['candidate_user_id'],
            'name': match['candidate_user_name'],
            'image_url':
                '$url/pic/${match['candidate_user_id']}/profilePic.png',
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
      print('Error fetching user data: ${response.statusCode}');
      print(responseBody);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf4ef),
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
                  margin: EdgeInsets.all(30),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(20),
                    //   color: Color.fromARGB(133, 217, 217, 217),
                    // ),
                    padding: EdgeInsets.all(15),
                    // margin: EdgeInsets.all(10),
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
                                  fit: BoxFit.cover,
                                )),
                            Text(
                              user['name'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Face score: ${user['stats']['face'].toString()}%',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Music score: ${user['stats']['music'].toString()}%',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Reels score: ${user['stats']['reels'].toString()}%',
                              style: TextStyle(fontSize: 16),
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
          MyStickyButtonBar()
        ],
      ),
    );
  }
}
