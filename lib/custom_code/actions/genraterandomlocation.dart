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

// write a function that Generate random coordinates near user's location (within ~1km radius
import 'dart:math';

Future<LatLng> genraterandomlocation(LatLng userlocation) async {
  final Random random = Random();

  // Generate random distance within 1km (0.01 degrees ≈ 1.1km)
  final double maxDistance = 0.01;
  final double distance = random.nextDouble() * maxDistance;

  // Generate random angle in radians
  final double angle = random.nextDouble() * 2 * pi;

  // Calculate new coordinates
  final double deltaLat = distance * cos(angle);
  final double deltaLng = distance * sin(angle);

  // Adjust longitude for latitude (longitude lines get closer near poles)
  final double adjustedDeltaLng =
      deltaLng / cos(userlocation.latitude * pi / 180);

  final double newLatitude = userlocation.latitude + deltaLat;
  final double newLongitude = userlocation.longitude + adjustedDeltaLng;

  return LatLng(newLatitude, newLongitude);
}
