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

import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<VideoPickResultStruct?> pickVideoAndGenerateThumbnail(
    bool fromCamera) async {
  try {
    final ImagePicker picker = ImagePicker();

    // 1. Pick the Video
    final ImageSource source =
        fromCamera ? ImageSource.camera : ImageSource.gallery;

    final XFile? video = await picker.pickVideo(
      source: source,
      maxDuration: const Duration(minutes: 10),
      preferredCameraDevice: CameraDevice.rear,
    );

    if (video == null) {
      return null;
    }

    print('Video Path: ${video.path}');

    // 2. Generate Thumbnail DATA (Not a file yet)
    // This matches the first example you provided.
    // It gets the raw bytes into memory.
    final Uint8List? uint8list = await VideoThumbnail.thumbnailData(
      video: video.path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 512, // A balance between quality and speed
      quality: 75,
    );

    if (uint8list == null) {
      print('Thumbnail data generation failed');
      // Return just the video path if thumbnail fails
      return VideoPickResultStruct(
        videoPath: video.path,
        thumbPath: null,
      );
    }

    // 3. Manually Save the File
    // Since we have the data, WE write the file. This is much more reliable on Android.
    final tempDir = await getTemporaryDirectory();
    final String fileName =
        'thumb_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final File file = File('${tempDir.path}/$fileName');

    // Write the bytes to the file
    await file.writeAsBytes(uint8list);

    print('Thumbnail saved successfully at: ${file.path}');

    // 4. Return result
    return VideoPickResultStruct(
      videoPath: video.path,
      thumbPath: file.path,
    );
  } catch (e) {
    print('Error: $e');
    return null;
  }
}
