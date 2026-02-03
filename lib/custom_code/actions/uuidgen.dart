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

import 'package:uuid/uuid.dart';
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

String? uuidgen() {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // write a function that genarate uuid randomly

  var uuid = Uuid();
  return uuid.v4(); // Generate a random UUID

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
