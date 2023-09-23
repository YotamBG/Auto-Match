import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/api.dart';

class FaceSelection extends StatefulWidget {
  const FaceSelection({Key? key});

  @override
  _FaceSelectionState createState() => _FaceSelectionState();
}

class _FaceSelectionState extends State<FaceSelection> {
  List<dynamic> selectedImageIds = []; // Stores the IDs of selected images
  List<Map<String, dynamic>> imagesList = [];

  @override
  void initState() {
    super.initState();
    // Fetch image data from the backend API
    fetchImageData();
  }

  void sendDataToServer() async {
    print('Sending req to server...');
    print(selectedImageIds);
    final jsonData = {
      "likedFaces": selectedImageIds,
      "nopedFaces": ['face200.jpg']
    }; // popuate nopedFaces with faces that weren't selected


    final trainFaceResponse = await api.dio.post(
      'http://10.0.2.2:5000/submitFaces',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: jsonEncode(jsonData),
    );

    
    final trainFaceReqResponse = trainFaceResponse.data.toString();
    print('Server Response: ${trainFaceReqResponse}');
    
    Navigator.pushNamed(context, '/submitMusic');
  }

  Future<void> fetchImageData() async {
    final url = 'http://10.0.2.2:5000';
    final response = await http.get(Uri.parse('$url/pics/catalog/30'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        imagesList = (jsonData['images'] as List<dynamic>)
            .asMap()
            .entries
            .map((entry) => {
                  'image_url': '$url/pic/catalog/${entry.value}',
                  'id': entry.value
                })
            .toList();
      });
    } else {
      // Handle error when fetching data
      print('Error fetching image data: ${response.statusCode}');
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
          AppBar(title: Text('Select Faces'), automaticallyImplyLeading: false),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
        ),
        itemCount: imagesList.length,
        itemBuilder: (context, index) {
          final face = imagesList[index];
          final isSelected = selectedImageIds.contains(face['id']);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedImageIds.remove(face['id']);
                } else {
                  selectedImageIds.add(face['id']);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                children: [
                  // Display the image
                  Image.network(
                    face['image_url'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  // Show a checkmark icon if selected
                  if (isSelected)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 32,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Send selectedImageIds to the backend server in an HTTP request
          print('Selected Image IDs: $selectedImageIds');
          sendDataToServer();
          // Add your HTTP request logic here
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
