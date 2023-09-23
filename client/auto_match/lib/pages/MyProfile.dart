import 'package:flutter/material.dart';
import '../services/auth.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key});

  @override
  MyProfileState createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> {
  String userName = ''; 

  @override
  void initState() {
    super.initState();
    loadUserProfile();
  }

  // Function to load the user profile
  Future<void> loadUserProfile() async {
    try {
      final user = await profileReq();
      setState(() {
        userName =
            user['name'];
      });
    } catch (e) {
      print('Error loading user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome, $userName!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Add more profile information widgets here as needed
        ],
      ),
    );
  }
}
