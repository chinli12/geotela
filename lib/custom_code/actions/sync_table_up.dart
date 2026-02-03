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

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

Future<String> syncTableUp(String tableName) async {
  // Add your function code here!
  try {
    // 1. Initialize SQLite
    final docsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docsDir.path, 'mydb.db');
    final db = await openDatabase(dbPath);

    // 2. Fetch Pending Items
    // We look for 'pending_upload' OR 'pending_update'
    final List<Map<String, dynamic>> pendingItems = await db.query(
      tableName,
      where: "sync_status IN (?, ?)",
      whereArgs: ['pending_upload', 'pending_update'],
    );

    if (pendingItems.isEmpty) {
      return "No pending items for $tableName";
    }

    final supabase = Supabase.instance.client;
    int successCount = 0;

    // 3. Loop and Upload
    for (var row in pendingItems) {
      // Create a mutable copy of the map so we can modify it
      Map<String, dynamic> dataToUpload = Map.from(row);

      // --- CLEANUP: Remove Local-Only Columns ---
      dataToUpload.remove('sync_status');

      // Note: If you have columns in SQLite that DON'T exist in Supabase
      // (like 'cached_like_count'), remove them here too:
      // dataToUpload.remove('like_count');
      // dataToUpload.remove('comment_count');

      // --- TRANSFORMATIONS: SQLite Types -> Supabase Types ---

      // A. Handle Booleans (SQLite uses 1/0, Supabase needs true/false)
      if (tableName == 'likes' || tableName == 'comment_likes') {
        if (dataToUpload.containsKey('is_active')) {
          dataToUpload['is_active'] = (row['is_active'] == 1);
        }
      }

      // B. Handle JSON Lists (SQLite uses String, Supabase needs List/JSON)
      if (tableName == 'groups') {
        if (dataToUpload['catigoris'] != null &&
            dataToUpload['catigoris'] is String) {
          try {
            dataToUpload['catigoris'] = jsonDecode(row['catigoris']);
          } catch (e) {
            dataToUpload['catigoris'] = []; // Fallback if parse fails
          }
        }
      }

      if (tableName == 'events') {
        if (dataToUpload['catigories'] != null &&
            dataToUpload['catigories'] is String) {
          try {
            dataToUpload['catigories'] = jsonDecode(row['catigories']);
          } catch (e) {
            dataToUpload['catigories'] = [];
          }
        }
      }

      if (tableName == 'events') {
        if (dataToUpload['rules'] != null && dataToUpload['rules'] is String) {
          try {
            dataToUpload['rules'] = jsonDecode(row['rules']);
          } catch (e) {
            dataToUpload['crules'] = [];
          }
        }
      }

      // 4. Perform Upload (Upsert)
      try {
        await supabase.from(tableName).upsert(dataToUpload);

        // 5. On Success: Update Local SQLite Status
        await db.update(
          tableName,
          {'sync_status': 'synced'},
          where: 'id = ?',
          whereArgs: [row['id']],
        );
        successCount++;
      } catch (uploadError) {
        print("Failed to upload $tableName item ${row['id']}: $uploadError");
        // We continue to the next item instead of crashing the whole batch
        continue;
      }
    }

    return "Success: Uploaded $successCount items to $tableName";
  } catch (e) {
    return "Error in syncTableUp: $e";
  }
}
