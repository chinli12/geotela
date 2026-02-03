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

Future<List<HuntStruct>> parsehuntJson(String jsonString) async {
  // Add your function code here!
  // Return an empty list if the string is null or empty
  if (jsonString.isEmpty) return [];

  try {
    // Clean markdown formatting (in case JSON includes ```json ... ```)
    jsonString =
        jsonString.replaceAll('```json', '').replaceAll('```', '').trim();

    final decoded = jsonDecode(jsonString);

    if (decoded is List) {
      return decoded.map<HuntStruct>((item) {
        if (item is Map<String, dynamic>) {
          return HuntStruct(
            title: item['title'] as String? ?? '',
            distance: item['distance'] as String? ?? '',
            // 👇 Convert `correctAnswer` to String safely
            points: item['points']?.toString() ?? '',
            description: item['description'] as String? ?? '',
            catigory: [item['category'] as String? ?? ''],
            task: List<String>.from(item['tasks'] ?? []),
          );
        }
        return HuntStruct();
      }).toList();
    }
  } catch (e) {
    print('Error parsing questions JSON: $e');
  }

  return [];
}
