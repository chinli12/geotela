// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';

Future setFCMToken() async {
  //await Firebase.initializeApp();
  // FlutterFlow already did this for you!

  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // 2. Request Permission
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // 3. Get the Token
      // Note: On iOS, this might be null if APNS isn't set up perfectly yet.
      String? fcmToken = await messaging.getToken();

      if (fcmToken != null) {
        // Save to App State
        FFAppState().fcmToken = fcmToken;
        print("FCM Token: $fcmToken");
      } else {
        FFAppState().fcmToken = "Error: Token is null";
      }
    } else {
      FFAppState().fcmToken = "Permission declined";
    }
  } catch (e) {
    FFAppState().fcmToken = "Error: $e";
  }
}
