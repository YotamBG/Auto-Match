import 'package:flutter/material.dart';
import '../services/auth.dart';

class UserProfile extends StatefulWidget {

  UserProfile({Key? key});

  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  String userName = '';

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
              'Thats $userName!',
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
