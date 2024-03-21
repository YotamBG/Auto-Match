import 'package:AUTO_MATCH/pages/all_users.dart';
import 'package:AUTO_MATCH/pages/my_profile.dart';
import 'package:AUTO_MATCH/pages/services/api.dart';
import 'package:AUTO_MATCH/pages/services/auth.dart';
import 'package:AUTO_MATCH/pages/sign_up/sign_up_memo.dart';
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
  try {
    final currentUserObject =
        await profileReq(); // this is to intialize the onReq inteceptor so cookies from prefs are sent.
  } catch (e) {
    print(e);
  }

  runApp(
    MaterialApp(
      initialRoute: isLoggedIn ? '/matches' : '/',
      routes: {
        '/': (context) => const Opening_screen(),
        '/login': (context) => buildScaffold(const Log_in(), context),
        '/match': (context) => buildScaffold(const Match(), context),
        '/matches': (context) => buildScaffold(const Matches(), context),
        '/sign_up_info': (context) =>
            buildScaffold(const Sign_up_info(), context),
        '/sign_up_reels': (context) =>
            buildScaffold(const Sign_up_reels(), context),
        '/sign_up_songs': (context) =>
            buildScaffold(const Sign_up_songs(), context),
        '/sign_up_filters': (context) =>
            buildScaffold(const Sign_up_filters(), context),
        '/sign_up_pic': (context) =>
            buildScaffold(const Sign_up_pic(), context),
        '/sign_up_face_training': (context) =>
            buildScaffold(const Sign_up_face_training(), context),
        '/sign_up_memo': (context) =>
            buildScaffold(const Sign_up_memo(), context),
        '/training_centre': (context) =>
            buildScaffold(const Training_centre(), context),
        '/my_profile': (context) => buildScaffold(const My_profile(), context),
        '/all_users': (context) => buildScaffold(const All_users(), context),
      },
    ),
  );
}

// TODO REMOVE:
Widget buildScaffold(Widget body, BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.grey,
    ),
    body: body,
  );
}
