import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase(String key) async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "${key}",
            authDomain: "newhome-d3971.firebaseapp.com",
            projectId: "newhome-d3971",
            storageBucket: "newhome-d3971.firebasestorage.app",
            messagingSenderId: "1024039756181",
            appId: "1:1024039756181:web:66242d387b6cd8d54a969c",
            measurementId: "G-CWME2F8439"));
  } else {
    await Firebase.initializeApp();
  }
}
