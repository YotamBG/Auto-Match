import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../services/api.dart';

class SubmitReels extends StatefulWidget {
  const SubmitReels({Key? key});

  @override
  SubmitReelsState createState() => SubmitReelsState();
}

class SubmitReelsState extends State<SubmitReels> {
  final TextEditingController _reelsController = TextEditingController();

  // Function to handle the sign-in action
  Future<void> submitReels() async {
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

    final reels = _reelsController.text;
    print(reels);
    final List<String> vids = reels
        .replaceAll(', ', ',')
        .split(','); // Split the input into an array of songs

    // send req to server
    print('Sending req to server...');
    final jsonData = {
      "reels": vids, // Send the array of songs to the server
    };
    print('jsonData:');
    print(jsonData);

    final signInReq = await api.dio.post(
      'http://10.0.2.2:5000/submitReels',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    final signInReqResponse = signInReq.data.toString();
    print('Server Response: ${signInReqResponse}');

    //hide loading
    Navigator.of(context).pop();
    //move to the next screeen
    Navigator.pushReplacementNamed(context, '/submitFace');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Submit Reels'), automaticallyImplyLeading: false),
      body: Column(
        children: [
          // Reels input field
          TextFormField(
            controller: _reelsController,
            decoration: InputDecoration(labelText: 'Reels'),
          ),
          ElevatedButton(
            onPressed: submitReels,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
