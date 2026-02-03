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

class PortraitVideoPlayer extends StatefulWidget {
  const PortraitVideoPlayer({
    super.key,
    this.width,
    this.height,
    required this.videoUrl,
  });

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  State<PortraitVideoPlayer> createState() => _PortraitVideoPlayerState();
}

class _PortraitVideoPlayerState extends State<PortraitVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the provided URL
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        _controller.setLooping(true); // Loop the video
        _controller.play(); // Start playback automatically
        if (mounted) {
          setState(() {}); // Rebuild to show the video once initialized
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      // Show a loading indicator while the video initializes
      return const Center(child: CircularProgressIndicator());
    }

    // Use AspectRatio to enforce the 9:16 portrait format
    // The value 9 / 16 (width/height) ensures it is tall and narrow.
    return AspectRatio(
      aspectRatio: 9 / 16,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    // IMPORTANT: Dispose of the controller to release resources
    _controller.dispose();
    super.dispose();
  }
}
