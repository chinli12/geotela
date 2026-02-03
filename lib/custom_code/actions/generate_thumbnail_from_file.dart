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

import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
// Needed for upload
import 'package:uuid/uuid.dart'; // Needed for unique filenames

Future<String?> generateThumbnailFromFile(
  FFUploadedFile fileBytes,
  String bucketName,
) async {
  // Add your function code here!
  if (fileBytes.bytes == null) {
    return null;
  }

  try {
    // 2. PREPARE VIDEO: Write the raw video bytes to a temp file
    final tempDir = await getTemporaryDirectory();
    final tempVideoPath = '${tempDir.path}/temp_processing_video.mp4';
    final videoFile = File(tempVideoPath);
    await videoFile.writeAsBytes(fileBytes.bytes!);

    // 3. GENERATE THUMBNAIL: Create the JPG locally
    final thumbPath = await VideoThumbnail.thumbnailFile(
      video: tempVideoPath,
      thumbnailPath: tempDir.path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 500,
      quality: 75,
    );

    if (thumbPath == null) return null;

    // 4. PREPARE UPLOAD: Read the new thumbnail into bytes
    final File thumbFile = File(thumbPath);
    final Uint8List thumbBytes = await thumbFile.readAsBytes();

    // 5. UPLOAD TO SUPABASE
    // Create a unique file path: e.g., "thumbnails/123-456-789.jpg"
    final uniqueId = const Uuid().v4();
    final uploadPath = 'thumbnails/$uniqueId.jpg';

    await SupaFlow.client.storage.from(bucketName).uploadBinary(
          uploadPath,
          thumbBytes,
          fileOptions: const FileOptions(
            contentType: 'image/jpeg',
            upsert: false,
          ),
        );

    // 6. GET PUBLIC URL
    final String publicUrl =
        SupaFlow.client.storage.from(bucketName).getPublicUrl(uploadPath);

    return publicUrl;
  } catch (e) {
    print('Error generating/uploading thumbnail: $e');
    return null;
  }
}
