import 'package:auto_match/pages/Home.dart';
import 'package:auto_match/pages/Matches.dart';
import 'package:auto_match/pages/SignIn.dart';
import 'package:auto_match/pages/SignUp.dart';
import 'package:auto_match/pages/SubmitFace.dart';
import 'package:auto_match/pages/SubmitMusic.dart';
import 'package:auto_match/pages/SubmitReels.dart';
import 'package:auto_match/pages/UserProfile.dart';
import 'package:flutter/material.dart';
import 'package:auto_match/pages/Loading.dart';
import 'package:auto_match/pages/FaceSelection.dart';
import 'package:auto_match/pages/MyProfile.dart';
import 'package:auto_match/pages/opening-screen.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/signUp': (context) => SignUp(),
          '/submitMusic': (context) => SubmitMusic(),
          '/submitReels': (context) => SubmitReels(),
          '/submitFace': (context) => SubmitFace(),
          '/signIn': (context) => SignIn(),
          '/faces': (context) => FaceSelection(),
          '/matches': (context) => Matches(),
          '/myProfile': (context) => MyProfile(),
          '/userProfile': (context) => UserProfile(),
          '/OpeningScreen': (context) => OpeningScreen(),
        },
      ),
    );
