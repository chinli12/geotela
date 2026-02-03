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

// fix the error in this code
import 'package:flutter_tts/flutter_tts.dart';

Future speak(
  String text,
  bool istop,
) async {
  final FlutterTts flutterTts = FlutterTts();

  try {
    if (istop) {
      await flutterTts.stop();
      return;
    }

    if (text.isEmpty) {
      return;
    }

    // Configure TTS settings
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);

    // Speak the text
    await flutterTts.speak(text);
  } catch (e) {
    print('Error in speak function: $e');
  }
}
