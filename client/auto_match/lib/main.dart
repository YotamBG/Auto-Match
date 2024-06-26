import 'package:AUTO_MATCH/pages/all_users.dart';
import 'package:AUTO_MATCH/pages/my_profile.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_memo.dart';
import 'package:AUTO_MATCH/pages/training%20centre/training_centre_faces.dart';
import 'package:AUTO_MATCH/pages/training_centre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_face_training.dart';
import 'package:AUTO_MATCH/pages/log_in.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_info.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_reels.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_songs.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_filters.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_pic.dart';
import 'package:AUTO_MATCH/pages/matches.dart';
import 'package:AUTO_MATCH/pages/opening_screen.dart';
import 'package:AUTO_MATCH/pages/match.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sessionManager = SessionManager();
Future<void> main() async {
  await dotenv.load(fileName: "lib/.env");
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize shared preferences
  await sessionManager.init();

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  print('isLoggedIn: $isLoggedIn');
  try {
    await profileReq(); // this is to intialize the onReq inteceptor so cookies from prefs are sent.
  } catch (e) {
    print(e);
  }

  runApp(
    MaterialApp(
      initialRoute: isLoggedIn ? '/matches' : '/',
      routes: {
        '/': (context) => const Opening_screen(),
        '/login': (context) => const Log_in(),
        '/match': (context) => const Match(),
        '/matches': (context) => const Matches(),
        '/sign_up_info': (context) => const Sign_up_info(),
        '/sign_up_reels': (context) => const Sign_up_reels(),
        '/sign_up_songs': (context) => const Sign_up_songs(),
        '/sign_up_filters': (context) => const Sign_up_filters(),
        '/sign_up_pic': (context) => const Sign_up_pic(),
        '/sign_up_face_training': (context) => const Sign_up_face_training(),
        '/sign_up_memo': (context) => const Sign_up_memo(),
        '/training_centre': (context) => const Training_centre(),
        '/training_centre_faces': (context) => const Training_centre_faces(),
        '/my_profile': (context) => const My_profile(),
        '/all_users': (context) => const All_users(),
      },
    ),
  );
}
