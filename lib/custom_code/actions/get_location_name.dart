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

import 'package:geocoding/geocoding.dart';
import '/flutter_flow/lat_lng.dart'; // This import is usually automatic

Future<String?> getLocationName(LatLng? location) async {
  // This is an async function, which is allowed in Custom Actions
  if (location == null) {
    return null;
  }

  try {
    // This is the line that gets the address from the coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );

    if (placemarks.isNotEmpty) {
      final Placemark place = placemarks.first;

      // 'place.name' is often the business/point of interest
      // 'place.street' is the street address
      // 'place.locality' is the city

      // You can customize this to return exactly what you want.
      // For a simple, full address:
      String address = [
        // place.name,
        // place.street,
        place.locality,
        //place.administrativeArea,
        place.country
      ].where((s) => s != null && s.isNotEmpty).join(', ');

      return address.isNotEmpty ? address : 'Unknown Location';
    } else {
      return 'No address found';
    }
  } catch (e) {
    print('Error in getLocationName: $e');
    return 'No loction'; // Return a user-friendly error
  }
}
