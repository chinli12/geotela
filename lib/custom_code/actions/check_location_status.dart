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

import 'package:geolocator/geolocator.dart';

Future checkLocationStatus() async {
  // 1. Check if System Location Service is enabled (GPS Toggle)
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  // 2. Check App Permission Status
  LocationPermission permission = await Geolocator.checkPermission();

  bool permissionGranted = false;
  if (permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always) {
    permissionGranted = true;
  }

  // 3. Update App State

  FFAppState().isLocationOn = serviceEnabled;
  FFAppState().hasLocationPermission = permissionGranted;

  // Debug Logs
  print('GPS Service On: $serviceEnabled');
  print('Permission Granted: $permissionGranted ($permission)');
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
