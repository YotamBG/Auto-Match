import 'package:flutter/material.dart';
// import 'dart:convert';

import '../services/api.dart';

class Matches extends StatefulWidget {
  const Matches({Key? key});

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
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

    final response = await api.dio.get('$url/match-fetch');

    final responseBody = response.data.toString();
    print(response.data['matches']);

    if (response.statusCode == 200) {
      // Parse the JSON response
      final jsonData = response.data;
      print(jsonData);
      setState(() {
        usersList = (jsonData['matches'] as List<dynamic>).map((match) {
          return {
            'id': match['candidate_user_id'],
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
      appBar: AppBar(
        title: Text('MATCHES'),
        actions: [
          ToggleButtons(
            children: [
              Icon(Icons.face),
              Icon(Icons.music_note),
              Icon(Icons.movie),
            ],
            selectedColor: Colors.white,
            isSelected: selectedFilters,
            onPressed: (index) {
              setState(() {
                selectedFilters[index] = !selectedFilters[index];
              });
              // Refetch data when filter toggles change
              fetchUserData();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          final user = usersList[index];

          return GestureDetector(
            onTap: () {
              print('clicked user ${user['id']}!');
              Navigator.pushNamed(context, '/userProfile', arguments: user['id']);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Display the image
                  Image.network(
                    user['image_url'],
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Text(
                    user['id'].toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    user['stats'].toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
