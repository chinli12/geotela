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
import 'dart:math';

Future<List<HistoryStoriesStruct>> parsestoriesJson(
    String? jsonString, LatLng? userlocation) async {
  // 1. Safety Checks
  if (jsonString == null || jsonString.isEmpty) {
    return [];
  }
  LatLng safeLocation = userlocation ?? LatLng(0, 0);

  // --- HELPER: Random Location Generator ---
  LatLng generateRandomLocation(LatLng center) {
    final Random random = Random();
    final double maxDistance = 0.01;
    final double distance = random.nextDouble() * maxDistance;
    final double angle = random.nextDouble() * 2 * pi;
    final double deltaLat = distance * cos(angle);
    final double deltaLng = distance * sin(angle);
    final double adjustedDeltaLng = deltaLng / cos(center.latitude * pi / 180);
    return LatLng(
        center.latitude + deltaLat, center.longitude + adjustedDeltaLng);
  }

  // --- HELPER: Smart JSON Extractor ---
  // This extracts the array [ ... ] by counting brackets, ignoring trailing garbage.
  String? extractArray(String input) {
    int startIndex = input.indexOf('[');
    if (startIndex == -1) return null;

    int level = 0;
    for (int i = startIndex; i < input.length; i++) {
      if (input[i] == '[')
        level++;
      else if (input[i] == ']') level--;

      // When level returns to 0, we found the matching closing bracket
      if (level == 0) {
        return input.substring(startIndex, i + 1);
      }
    }
    return null;
  }

  try {
    String cleanString = jsonString;

    // 2. Handle API Wrapper (If you passed the full API response object)
    // We try to decode it as a map first to see if it's the wrapper
    try {
      if (cleanString.trim().startsWith('{')) {
        final dynamic outerJson = jsonDecode(cleanString);
        if (outerJson is Map<String, dynamic> &&
            outerJson.containsKey('candidates')) {
          final candidates = outerJson['candidates'] as List;
          if (candidates.isNotEmpty) {
            final parts = candidates[0]['content']['parts'] as List;
            if (parts.isNotEmpty) {
              cleanString = parts[0]['text'];
            }
          }
        }
      }
    } catch (_) {
      // Not a valid JSON object or not the wrapper, proceed with original string
    }

    // 3. Remove Markdown
    cleanString =
        cleanString.replaceAll('```json', '').replaceAll('```', '').trim();

    // 4. Use Smart Extraction to handle garbage like " } ]" at the end
    String? extractedArray = extractArray(cleanString);
    if (extractedArray != null) {
      cleanString = extractedArray;
    }

    // 5. Decode
    // Handle the escaped quotes issue (if input was literally "[\n \"title\"...")
    // Standard jsonDecode handles strict JSON.
    // If the input was a raw string literal with backslashes, we might need to unescape,
    // but usually jsonDecode works fine if the string is valid.
    final decoded = jsonDecode(cleanString);

    // 6. Map to Struct
    if (decoded is List) {
      return decoded.map<HistoryStoriesStruct>((item) {
        if (item is Map<String, dynamic>) {
          final LatLng newLoc = generateRandomLocation(safeLocation);

          return HistoryStoriesStruct(
            title: item['title'] as String? ?? '',
            description: item['description'] as String? ?? '',
            fullNarrative: item['fullNarrative'] as String? ?? '',

            // FIX: Ensure readTime is a String (API returns int 3)
            readTime: item['readTime'].toString(),

            // FIX: Handle Points safely (int or string)
            points: item['points'] is int
                ? item['points']
                : int.tryParse(item['points'].toString()) ?? 0,

            catigory: [
              item['catigory'] as String? ??
                  item['category'] as String? ??
                  'General'
            ],

            // FIX: Map the image
            imageUrl: item['image_url'] as String? ?? '',

            latitude: newLoc.latitude,
            longitude: newLoc.longitude,
          );
        }
        return HistoryStoriesStruct();
      }).toList();
    }
  } catch (e) {
    print('Error parsing stories JSON: $e');
  }

  return [];
}
