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

Future<String?> generateThumbnailFromFilepath(FFUploadedFile fileBytes) async {
  // Add your function code here!
  if (fileBytes.bytes == null) {
    return null;
  }

  try {
    // 2. Get the temporary directory of the phone
    final tempDir = await getTemporaryDirectory();

    // 3. Create a temporary video file to write the bytes to
    // We give it a generic name like 'temp_video.mp4'
    final tempVideoPath = '${tempDir.path}/temp_processing_video.mp4';
    final videoFile = File(tempVideoPath);

    // 4. Write the FFUploadedFile bytes to this real file
    await videoFile.writeAsBytes(fileBytes.bytes!);

    // 5. Generate the thumbnail from this temporary file
    // final thumbPath = await VideoThumbnail.thumbnailFile(
    // video: tempVideoPath,
    //thumbnailPath: tempDir.path,
    //imageFormat: ImageFormat.JPEG,
    // maxHeight: 500, // Keep quality moderate for speed
    // quality: 75,
    // );

    return tempVideoPath;
  } catch (e) {
    print('Error generating thumbnail: $e');
    return null;
  }
}
