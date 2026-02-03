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

import 'dart:convert';

Future<TripStruct> parsetripJson(String jsonString) async {
  // Return an empty struct if the string is null or empty
  if (jsonString.isEmpty) {
    return TripStruct();
  }

  try {
    // Clean markdown formatting
    jsonString =
        jsonString.replaceAll('```json', '').replaceAll('```', '').trim();

    final decoded = jsonDecode(jsonString);

    // Check if the decoded JSON is a Map (a single object)
    if (decoded is Map<String, dynamic>) {
      final item = decoded; // Use the map directly

      // 1. Get the locations list (which is a List of Maps)
      final locationsList = item['locations'] as List<dynamic>? ?? [];

      // 2. Map that list into a List<TriplocationStruct>
      final parsedLocations = locationsList.map<TriplocationStruct>((locItem) {
        if (locItem is Map<String, dynamic>) {
          // 3. Use your 'triplocation' Data Type here
          return TriplocationStruct(
            id: locItem['id'] as String? ?? '',
            name: locItem['name'] as String? ?? '',
            address: locItem['address'] as String? ?? '',
            estimatedTime: locItem['estimatedTime'] as String? ?? '',
            type: locItem['type'] as String? ?? '',
          );
        }
        return TriplocationStruct(); // Return empty struct if data is bad
      }).toList();

      // 4. Create and return the single TripStruct
      return TripStruct(
        title: item['title'] as String? ?? '',
        date: item['date'] as String? ?? '',
        duration: item['duration']?.toString() ?? '',
        totalDistance: item['totalDistance'] as String? ?? '',
        difficulty: item['difficulty'] as String? ?? '',
        locations: parsedLocations, // Assign the parsed list here
      );
    }
  } catch (e) {
    print('Error parsing trip JSON: $e');
  }

  // Return an empty struct if parsing fails or JSON is not a map
  return TripStruct();
}
