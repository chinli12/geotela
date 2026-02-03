// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:video_player/video_player.dart';

class CircularVideoPlayer extends StatefulWidget {
  const CircularVideoPlayer({
    super.key,
    this.width,
    this.height,
    required this.videoUrl,
    required this.radius,
  });

  final double? width;
  final double? height;
  final String videoUrl;
  final double radius;

  @override
  State<CircularVideoPlayer> createState() => _CircularVideoPlayerState();
}

class _CircularVideoPlayerState extends State<CircularVideoPlayer> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        // _controller.setLooping(true); // Loop the video continuously
        //_controller.play(); // Start playing automatically
        if (mounted) {
          setState(() {}); // Rebuild the widget once the video is initialized
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      // Show a placeholder or loading indicator while the video initializes
      return CircleAvatar(
        radius: widget.radius,
        backgroundColor: Colors.grey.shade300,
        child: const CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 33, 243, 128)),
          strokeWidth: 2,
        ),
      );
    }

    // Ensure the video is ready before trying to display it
    if (_controller.value.hasError) {
      return CircleAvatar(
        radius: widget.radius,
        backgroundColor: Colors.red.shade200,
        child: Icon(Icons.error, color: Colors.red.shade800),
      );
    }

    // The core of the circular video:
    // 1. SizedBox constrains the size to the diameter (2 * radius).
    // 2. ClipOval clips its child into an oval (or circle if the child is square).
    // 3. FittedBox ensures the video fills the circular area, cropping as needed.
    // 4. VideoPlayer displays the video.
    return SizedBox(
      width: widget.radius * 2,
      height: widget.radius * 2,
      child: ClipOval(
        child: FittedBox(
          fit: BoxFit
              .cover, // Important: This makes the video fill the circle, cropping if its aspect ratio doesn't match
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // IMPORTANT: Release the video controller when the widget is removed
    _controller.dispose();
    super.dispose();
  }
}
