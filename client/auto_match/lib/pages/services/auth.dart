import 'dart:convert';
import 'package:AUTO_MATCH/main.dart';
// import 'package:dio/dio.dart' show Options;
import 'package:http/http.dart' as http; //switch to dio
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'api.dart';

Future<dynamic> signUpReq({
  required String email,
  required String password,
  required String name,
  required String bio,
  required String location,
  required int age,
}) async {
  try {
    print('Sending sign-up request to server...');
    final jsonData = {
      "email": email,
      "password": password,
      "name": name,
      "bio": bio,
      "location": location,
      "age": age,
    };
    final signUpReq = await http.post(
      Uri.parse('${dotenv.env["SERVER_URL"]}/signUp'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(jsonData),
    );

    print('Server Response: ${signUpReq.body}');
    final signUpReqResponse = json.decode(signUpReq.body);
    print('Response: ${signUpReqResponse["message"]}');
    return signUpReqResponse.statusCode; // Return the HTTP status code
  } catch (e) {
    print('Error during sign-up: $e');
  }
}

Future<dynamic> signInReq(
    {required String email, required String password}) async {
  try {
    print('Sending sign-in request to server...');
    final jsonData = {
      "email": email,
      "password": password,
    };

    await sessionManager.login();

    final signInReq = await api.dio.post(
      '${dotenv.env["SERVER_URL"]}/signIn',
      // options: Options(headers: {"Content-Type": "application/json", "persistentConnection": "true"}),
      data: jsonEncode(jsonData),
    );

    final signInReqResponse = signInReq.data.toString();
    print('Server Response: $signInReqResponse');
    return signInReqResponse; // Return the HTTP status code
  } catch (e) {
    print('Error during sign-in: $e');
  }
}

Future<Map<String, dynamic>> profileReq([int? userID]) async {
  try {
    print('userID:');
    print(userID);

    final apiUrl = userID != null
        ? '${dotenv.env["SERVER_URL"]}/user-profile/$userID'
        : '${dotenv.env["SERVER_URL"]}/my-profile';

    final profileReq = await api.dio.get(
      apiUrl,
      // options: Options(headers: {"Content-Type": "application/json", "persistentConnection": "true"}),
    );

    print('Server Response: ${profileReq.data.toString()}');
    final profileReqResponse = profileReq.data;
    return profileReqResponse; // Return the user
  } catch (e) {
    print('Error during profile fetch: $e');
    return {'message': 'error'}; // Return an error message
  }
}
