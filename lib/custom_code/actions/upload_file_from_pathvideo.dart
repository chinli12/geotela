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

import 'dart:io';
import 'package:uuid/uuid.dart';

Future<String?> uploadFileFromPathvideo(
  String filePath,
  String bucketName,
) async {
  try {
    final File file = File(filePath);
    final String uniqueId = const Uuid().v4();
    // Determine extension (simplified)
    final String ext = filePath.split('.').last;
    final String uploadPath = 'videos/$uniqueId.$ext';

    await SupaFlow.client.storage.from(bucketName).upload(
          uploadPath,
          file,
          fileOptions: const FileOptions(
            upsert: false,
          ),
        );

    final String publicUrl =
        SupaFlow.client.storage.from(bucketName).getPublicUrl(uploadPath);

    return publicUrl;
  } catch (e) {
    print('Upload error: $e');
    return null;
  }
  // Add your function code here!
}
