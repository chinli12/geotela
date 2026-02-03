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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'dart:convert';

List<dynamic> mergePostsJson(
  List<dynamic>? currentList,
  List<dynamic>? newList,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // 1. Safety Checks
  if (newList == null || newList.isEmpty) {
    return currentList ?? [];
  }

  // 2. Convert current list to a Map for fast lookup (ID -> Item)
  Map<String, dynamic> postsMap = {};

  if (currentList != null) {
    for (var item in currentList) {
      if (item is Map<String, dynamic> && item['id'] != null) {
        postsMap[item['id'].toString()] = item;
      }
    }
  }

  // 3. Merge new items (Insert/Update)
  for (var item in newList) {
    // Check if item is valid
    if (item == null) continue;

    // Ensure item is a mutable Map (Create a copy)
    Map<String, dynamic> safeItem = {};
    if (item is Map) {
      safeItem = Map<String, dynamic>.from(item);
    } else {
      continue; // Skip if not a map
    }

    if (safeItem['id'] != null) {
      // 🛠️ DATA CLEANUP 🛠️

      // Fix liked_user_ids (Ensure it is a List)
      if (safeItem['liked_user_ids'] == null) {
        safeItem['liked_user_ids'] = [];
      } else if (safeItem['liked_user_ids'] is String) {
        try {
          safeItem['liked_user_ids'] = jsonDecode(safeItem['liked_user_ids']);
        } catch (_) {
          safeItem['liked_user_ids'] = [];
        }
      } else if (safeItem['liked_user_ids'] is! List) {
        safeItem['liked_user_ids'] = [];
      }

      // Fix Counts (Ensure they are Int)
      if (safeItem['like_count'] is String) {
        safeItem['like_count'] = int.tryParse(safeItem['like_count']) ?? 0;
      }
      if (safeItem['comment_count'] is String) {
        safeItem['comment_count'] =
            int.tryParse(safeItem['comment_count']) ?? 0;
      }

      // Add to Map (Overwrites old data with new cleaned data)
      postsMap[safeItem['id'].toString()] = safeItem;
    }
  }

  // 4. Convert back to list and Sort
  List<dynamic> mergedList = postsMap.values.toList();

  mergedList.sort((a, b) {
    String dateA = a['created_at'] ?? '';
    String dateB = b['created_at'] ?? '';
    return dateB.compareTo(dateA);
  });

  // 5. Safety Cap
  if (mergedList.length > 1000) {
    mergedList = mergedList.sublist(0, 1000);
  }

  return mergedList;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
