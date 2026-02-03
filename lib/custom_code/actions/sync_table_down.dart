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

Future<String> syncTableDown(
  String tableName,
  List<dynamic> data,
) async {
  // Add your function code here!
  String resultMessage = "Error: Unknown";
  try {
    // 1. Initialize Database
    final docsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docsDir.path, 'mydb.db');
    final db = await openDatabase(dbPath);

    Batch batch = db.batch();

    for (var rawItem in data) {
      // -----------------------------------------------------------
      // 🛠️ DATA EXTRACTION (Handle Row Object vs Map)
      // -----------------------------------------------------------
      Map<String, dynamic> item;

      if (rawItem is Map<String, dynamic>) {
        // It's already JSON (Perfect)
        item = rawItem;
      } else {
        // It's a Supabase Row Object (e.g., PostsRow).
        // We try to access the '.data' property dynamically.
        try {
          // 'data' is the property in FF Supabase Rows that holds the JSON Map
          item = rawItem.data;
        } catch (e) {
          // Fallback: If .data fails, try toMap() or skip
          try {
            item = rawItem.toMap();
          } catch (e2) {
            print("Error extracting data from row: $e2");
            continue; // Skip this item if we can't read it
          }
        }
      }

      // -----------------------------------------------------------
      // 🛑 SOFT DELETE CHECK
      // -----------------------------------------------------------
      if (item['deleted_at'] != null) {
        batch.rawDelete('DELETE FROM "$tableName" WHERE id = ?', [item['id']]);
        continue;
      }

      // -----------------------------------------------------------
      // 🔄 INSERT / UPDATE LOGIC
      // -----------------------------------------------------------
      switch (tableName) {
        // 1. PROFILES
        case 'profiles':
          batch.rawInsert('''
            INSERT OR REPLACE INTO profiles (
              id, username, avatar_url, updated_at, bio, cover_photo_url, 
              full_name, last_seen, total_xp, current_streak, longest_streak, 
              last_active_date, sync_status
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'synced')
          ''', [
            item['id'],
            item['username'],
            item['avatar_url'],
            item['updated_at'],
            item['bio'],
            item['cover_photo_url'],
            item['full_name'],
            item['last_seen'],
            item['total_xp'] ?? 0,
            item['current_streak'] ?? 0,
            item['longest_streak'] ?? 0,
            item['last_active_date']
          ]);
          break;

        // 2. GROUPS
        case 'groups':
          batch.rawInsert('''
            INSERT OR REPLACE INTO "groups" (
              id, name, description, privacy, created_by, created_at, 
              image_url, location, catigoris,sync_status
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'synced')
          ''', [
            item['id'],
            item['name'],
            item['description'],
            item['privacy'],
            item['created_by'],
            item['created_at'],
            item['image_url'],
            item['location'],
            item['catigoris']
          ]);
          break;

        // 3. POSTS
        case 'posts':
          batch.rawInsert('''
            INSERT OR REPLACE INTO posts (
              id, content, media_url, media_type, location, created_at, 
              user_id, title, thumbnails, username, avatar_url, group_id, 
              comment_count, like_count, sync_status
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'synced')
          ''', [
            item['id'],
            item['content'],
            item['media_url'],
            item['media_type'],
            item['location'],
            item['created_at'],
            item['user_id'],
            item['title'],
            item['thumbnails'],

            // -------------------------------------------------
            // 🛑 FIX: THESE DO NOT EXIST IN POSTS JSON
            // We pass null. The UI will get this data by joining
            // with the local 'profiles' table using 'user_id'.
            // -------------------------------------------------
            null, // username
            null, // avatar_url

            item['group_id'],
            item['comment_count'] ?? 0,
            item['like_count'] ?? 0
          ]);
          break;

        // 4. COMMENTS
        case 'comments':
          batch.rawInsert('''
            INSERT OR REPLACE INTO comments (
              id, post_id, content, parent_comment_id, created_at, 
              user_id, comment_count, like_count, sync_status
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'synced')
          ''', [
            item['id'],
            item['post_id'],
            item['content'],
            item['parent_comment_id'],
            item['created_at'],
            item['user_id'],
            item['comment_count'] ?? 0,
            item['like_count'] ?? 0
          ]);
          break;

        // 5. LIKES
        case 'likes':
          int isActive =
              (item['is_active'] == true || item['is_active'] == 1) ? 1 : 0;
          batch.rawInsert('''
            INSERT OR REPLACE INTO likes (
              id, post_id, user_id, is_active, sync_status
            ) VALUES (?, ?, ?, ?, 'synced')
          ''', [item['id'], item['post_id'], item['user_id'], isActive]);
          break;

        // 6. COMMENT LIKES
        case 'comment_likes':
          int isActiveComment =
              (item['is_active'] == true || item['is_active'] == 1) ? 1 : 0;
          batch.rawInsert('''
            INSERT OR REPLACE INTO comment_likes (
              id, comment_id, user_id, is_active, sync_status
            ) VALUES (?, ?, ?, ?, 'synced')
          ''', [
            item['id'],
            item['comment_id'],
            item['user_id'],
            isActiveComment
          ]);
          break;

        // 7. EVENTS
        case 'events':
          batch.rawInsert('''
            INSERT OR REPLACE INTO events (
              id, name, description, date_start, time_start, location, 
              image_url, created_by, created_at, catigories, sync_status
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'synced')
          ''', [
            item['id'],
            item['name'],
            item['description'],
            item['date_start'],
            item['time_start'],
            item['location'],
            item['image_url'],
            item['created_by'],
            item['created_at'],
            item['catigories'] is List
                ? jsonEncode(item['catigories'])
                : item['catigories']
          ]);
          break;

        // 8. EVENTS ATTENDEE
        case 'event_attendees':
          batch.rawInsert('''
            INSERT OR REPLACE INTO event_attendees (
              id, event_id, user_id, created_at, sync_status
            ) VALUES (?, ?, ?, ?, 'synced')
          ''', [
            item['id'],
            item['event_id'],
            item['user_id'],
            item['created_at']
          ]);
          break;

        // 9. GROUP MEMBERS
        case 'group_members':
          batch.rawInsert('''
            INSERT OR REPLACE INTO group_members (
              id, group_id, user_id, created_at, sync_status
            ) VALUES (?, ?, ?, ?, 'synced')
          ''', [
            item['id'],
            item['group_id'],
            item['user_id'],
            item['created_at']
          ]);
          break;
      }
    }

    await batch.commit(noResult: true);
    resultMessage = "Success: Synced ${data.length} items to $tableName";
  } catch (e) {
    resultMessage = "Error syncing $tableName: $e";
  }
  return resultMessage;
}
