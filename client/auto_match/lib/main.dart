import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_face_training.dart';
import 'package:AUTO_MATCH/pages/log_in.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_info.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_reels.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_music.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_filters.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_pic.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_memo.dart';
import 'package:AUTO_MATCH/pages/matches.dart';
import 'package:AUTO_MATCH/pages/opening_screen.dart';
import 'package:AUTO_MATCH/pages/match.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/.env");
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Opening_screen(),
        '/login': (context) => const Log_in(),
        '/match': (context) => const Match(),
        '/matches': (context) => const Matches(),
        '/sign_up_info': (context) => const Sign_up_info(),
        '/sign_up_reels': (context) => const Sign_up_reels(),
        '/sign_up_music': (context) => const Sign_up_music(),
        '/sign_up_filters': (context) => const Sign_up_filters(),
        '/sign_up_pic': (context) => const Sign_up_pic(),
        '/sign_up_memo': (context) => const Sign_up_memo(),
        '/sign_up_face_training': (context) => const Sign_up_face_training(),
      },
    ),
  );
}
