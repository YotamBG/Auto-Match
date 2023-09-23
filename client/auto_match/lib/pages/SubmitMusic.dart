import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../services/api.dart';

class SubmitMusic extends StatefulWidget {


  const SubmitMusic({Key? key});

  @override
  SubmitMusicState createState() => SubmitMusicState();
}

class SubmitMusicState extends State<SubmitMusic> {
  final TextEditingController _musicController = TextEditingController();

  // Function to handle the sign-in action
  Future<void> submitMusic() async {
    //show loading
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AlertDialog(
        content: SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    final music = _musicController.text;
    print(music);
    final List<String> songs = music.replaceAll(', ', ',').split(','); // Split the input into an array of songs

  // send req to server
    print('Sending req to server...');
    final jsonData = {
      "music": songs, // Send the array of songs to the server
    };
    print('jsonData:');
    print(jsonData);
    
    
    final signInReq = await api.dio.post(
      'http://10.0.2.2:5000/submitMusic',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    
    final signInReqResponse = signInReq.data.toString();
    print('Server Response: ${signInReqResponse}');

    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    Navigator.pushNamed(context, '/submitReels');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Submit Music'), automaticallyImplyLeading: false),
      body: Column(
        children: [
          // Music input field
          TextFormField(
            controller: _musicController,
            decoration: InputDecoration(labelText: 'Music'),
          ),
          ElevatedButton(
            onPressed: submitMusic,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
