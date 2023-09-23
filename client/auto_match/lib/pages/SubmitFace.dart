import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/api.dart';

class SubmitFace extends StatefulWidget {
  const SubmitFace({Key? key}) : super(key: key);

  @override
  _SubmitFaceState createState() => _SubmitFaceState();
}

class _SubmitFaceState extends State<SubmitFace> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile; // Variable to store the selected image file

  // Function to handle the sign-in action
  Future<void> submitFace() async {
    final statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();
    print('statuses:');
    print(statuses);

    // Show loading dialog
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

    try {
      if (_imageFile != null) {
        // Get the image file path
        final String imagePath = _imageFile!.path;

        // Send the image file to the server using Dio
        final FormData formData = FormData.fromMap({
          "face": await MultipartFile.fromFile(
            imagePath,
            filename: 'face_image.jpg',
          ),
        });

        print('Sending req to server...');

        final Response response = await api.dio.post(
          'http://10.0.2.2:5000/submitFace',
          data: formData,
        );

        final signInReqResponse = response.data.toString();
        print('Server Response: ${signInReqResponse}');
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error: $e');
    }

    // Hide loading dialog
    Navigator.of(context).pop();

    // Move to the next screen
    Navigator.pushReplacementNamed(context, '/home');
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Face'),
      ),
      body: Center(
        child: Column(
          children: [
            // Image picker button
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            // Display the selected image
            _imageFile != null
                ? Image.file(
                    File(_imageFile!.path),
                    width: 100,
                    height: 100,
                  )
                : SizedBox(),
            ElevatedButton(
              onPressed: submitFace,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
