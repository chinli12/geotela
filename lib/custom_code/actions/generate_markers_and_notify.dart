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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import '/flutter_flow/lat_lng.dart';
import '/app_state.dart'; // 👈 Needed for App State

Future<List<LatLng>> generateMarkersAndNotify(
  List<dynamic> stories,
) async {
  // 1. Generate the List of LatLng
  List<LatLng> markers = stories.map((e) {
    if (e is! Map) return LatLng(0.0, 0.0);

    dynamic latVal;
    dynamic lngVal;

    // Check Root Level
    latVal = e['latitude'];
    lngVal = e['longitude'] ?? e['longtitude'];

    // Check Nested Map
    if (latVal == null || lngVal == null) {
      final loc = e['location'];
      if (loc is Map) {
        latVal = loc['lat'] ?? loc['latitude'];
        lngVal = loc['lon'] ?? loc['long'] ?? loc['longitude'];
      }
    }

    double lat = (latVal as num?)?.toDouble() ?? 0.0;
    double lng = (lngVal as num?)?.toDouble() ?? 0.0;

    return LatLng(lat, lng);
  }).toList();

  // 2. ✅ Update App State to TRUE
  // This tells your UI "The data is ready, show the map now!"
  FFAppState().update(() {
    FFAppState().isDataReady = true;
  });

  // 3. Return the list
  return markers;
}
