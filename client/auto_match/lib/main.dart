import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/sign-up-process-12.dart';
import 'package:myapp/pages/sign-up-process-13.dart';
import 'package:myapp/pages/sign-up-process-14.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/pages/log-in-process.dart';
import 'package:myapp/pages/sign-up-process-1.dart';
import 'package:myapp/pages/sign-up-process-2.dart';
import 'package:myapp/pages/sign-up-process-3.dart';
import 'package:myapp/pages/sign-up-process-4.dart';
import 'package:myapp/pages/sign-up-process-5.dart';
import 'package:myapp/pages/sign-up-process-6.dart';
import 'package:myapp/pages/sign-up-process-7.dart';
import 'package:myapp/pages/sign-up-process-8.dart';
import 'package:myapp/pages/sign-up-process-9.dart';
import 'package:myapp/pages/sign-up-process-10.dart';
import 'package:myapp/pages/sign-up-process-11.dart';
import 'package:myapp/pages/new-match-alert.dart';
import 'package:myapp/pages/matches.dart';
import 'package:myapp/pages/opening-screen.dart';
import 'package:myapp/pages/new-match.dart';
import 'package:myapp/pages/chats.dart';
import 'package:myapp/pages/back-arrow.dart';
import 'package:myapp/pages/specific-chat.dart';
import 'package:myapp/pages/profile.dart';
import 'package:myapp/pages/icon-settings-2-outline.dart';
import 'package:myapp/pages/logo.dart';
import 'package:myapp/pages/edit-profile.dart';
import 'package:myapp/pages/preview-profile.dart';
import 'package:myapp/pages/prefrences.dart';
import 'package:myapp/pages/icon-eye.dart';


void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) =>  opening_screen(),
          '/login': (context) => log_in_process(),
          '/new_match_alert': (context) => new_match_alert(),
          '/new_match': (context) => new_match(),
          '/matches': (context) => matches(),
          '/signup': (context) => sign_up_process_1(),
          '/signup5': (context) => sign_up_process_5(),
          '/signup6': (context) => sign_up_process_6(),
          '/signup7': (context) => sign_up_process_7(),
          '/signup8': (context) => sign_up_process_8(),
          '/signup9': (context) => sign_up_process_9(),
          '/signup10': (context) => sign_up_process_10(),
          '/signup11': (context) => sign_up_process_11(),
          '/signup12': (context) => sign_up_process_12(),
          '/signup13': (context) => sign_up_process_13(),
          '/signup14': (context) => sign_up_process_14(),
          '/match': (context) => new_match(),
        },
      ),
    );

