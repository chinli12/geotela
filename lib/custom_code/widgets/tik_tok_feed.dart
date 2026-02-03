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
import 'package:cached_network_image/cached_network_image.dart';

class TikTokFeed extends StatefulWidget {
  const TikTokFeed({
    Key? key,
    this.width,
    this.height,
    required this.videoRows,
    this.initialIndex = 0,
    this.initialPostId, // <--- CHANGED TO STRING (UUID)
    this.onPageChanged,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<PostsWithMetaVideoRow> videoRows;
  final int initialIndex;
  final String? initialPostId; // <--- CHANGED TO STRING (UUID)
  final Future<dynamic> Function()? onPageChanged;

  @override
  _TikTokFeedState createState() => _TikTokFeedState();
}

class _TikTokFeedState extends State<TikTokFeed> {
  late PageController _pageController;
  int _currentIndex = 0;

  List<VideoPostStruct> _posts = [];
  final Map<int, VideoPlayerController> _controllers = {};

  @override
  void initState() {
    super.initState();

    // --- 1. FIND THE CORRECT STARTING INDEX ---
    // We default to the passed integer index (usually 0)
    int targetIndex = widget.initialIndex;

    // If a UUID ID was passed, we search the list for it
    if (widget.initialPostId != null && widget.initialPostId!.isNotEmpty) {
      // Find the index of the item where row.id matches initialPostId
      // We explicitly .toString() just in case Supabase generated it differently,
      // but usually both are Strings.
      int foundIndex = widget.videoRows
          .indexWhere((row) => row.id.toString() == widget.initialPostId);

      if (foundIndex != -1) {
        targetIndex = foundIndex;
        print(
            "TikTokFeed: Found UUID ${widget.initialPostId} at index $targetIndex");
      } else {
        print(
            "TikTokFeed WARNING: UUID ${widget.initialPostId} not found in list. Defaulting to index $targetIndex");
      }
    }

    _currentIndex = targetIndex;
    _pageController = PageController(initialPage: _currentIndex);

    // --- 2. Process List ---
    try {
      _posts = widget.videoRows.map((row) {
        return VideoPostStruct(
          mediaUrl: row.mediaUrl,
          title: row.title,
          content: row.content,
          username: row.username,
          avatarUrl: row.avatarUrl,
          location: row.location,
          id: row.id, // Assuming this is passed correctly as struct field
          thumbnails: row.thumbnails,
        );
      }).toList();

      if (_posts.isNotEmpty) {
        _initializeActiveWindow();
      }
    } catch (e) {
      print("TikTokFeed CRASH during mapping: $e");
    }

    _pageController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final int nextIndex = _pageController.page!.round();

    if (_currentIndex != nextIndex) {
      setState(() {
        _currentIndex = nextIndex;
      });

      FFAppState().activeVideoPost = _posts[_currentIndex];
      if (widget.onPageChanged != null) {
        widget.onPageChanged!();
      }

      _initializeActiveWindow();
    }
  }

  // --- SMART BUFFERING LOGIC ---
  void _initializeActiveWindow() {
    // 1. Initialize Current
    _initializeControllerAtIndex(_currentIndex);

    // 2. Preload Next 2
    _initializeControllerAtIndex(_currentIndex + 1);
    _initializeControllerAtIndex(_currentIndex + 2);

    // 3. Re-initialize Previous (Fixes the "Swipe Back" bug)
    if (_currentIndex > 0) {
      _initializeControllerAtIndex(_currentIndex - 1);
    }

    // 4. Play Current, Pause Others
    _controllers.forEach((key, controller) {
      if (key == _currentIndex) {
        controller.play();
      } else {
        controller.pause();
      }
    });

    // 5. Dispose of videos outside our window
    _controllers.keys.toList().forEach((key) {
      if (key < _currentIndex - 1 || key > _currentIndex + 2) {
        _controllers[key]?.dispose();
        _controllers.remove(key);
      }
    });
  }

  void _initializeControllerAtIndex(int index) {
    if (index < 0 || index >= _posts.length) return;

    // Only initialize if not already in the map
    if (!_controllers.containsKey(index)) {
      final controller = VideoPlayerController.networkUrl(
        Uri.parse(_posts[index].mediaUrl),
      );

      _controllers[index] = controller;

      controller.initialize().then((_) {
        controller.setLooping(true);
        // If we finished initializing and it's still the current video, play it
        if (index == _currentIndex) {
          controller.play();
        }
        if (mounted) setState(() {});
      });
    } else {
      // If controller exists but was paused (swiped back), ensure it's ready
      if (index == _currentIndex && !_controllers[index]!.value.isPlaying) {
        _controllers[index]!.play();
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_posts.isEmpty) {
      return Container(color: Colors.black);
    }

    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.black,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return _TikTokVideoItem(
            controller: _controllers[index],
            post: _posts[index],
            thumbnailUrl: widget.videoRows[index].thumbnails,
            initialized: _controllers[index]?.value.isInitialized ?? false,
          );
        },
      ),
    );
  }
}

class _TikTokVideoItem extends StatefulWidget {
  final VideoPlayerController? controller;
  final VideoPostStruct post;
  final String? thumbnailUrl;
  final bool initialized;

  const _TikTokVideoItem({
    Key? key,
    required this.controller,
    required this.post,
    this.thumbnailUrl,
    required this.initialized,
  }) : super(key: key);

  @override
  State<_TikTokVideoItem> createState() => _TikTokVideoItemState();
}

class _TikTokVideoItemState extends State<_TikTokVideoItem> {
  bool _isPausedByUser = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.controller == null || !widget.initialized) return;
        setState(() {
          if (widget.controller!.value.isPlaying) {
            widget.controller!.pause();
            _isPausedByUser = true;
          } else {
            widget.controller!.play();
            _isPausedByUser = false;
          }
        });
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          // LAYER 1: The Thumbnail
          if (widget.thumbnailUrl != null && widget.thumbnailUrl!.isNotEmpty)
            CachedNetworkImage(
              imageUrl: widget.thumbnailUrl!,
              fit: BoxFit.cover,
            )
          else
            Container(color: Colors.black),

          // LAYER 2: The Video
          if (widget.initialized && widget.controller != null)
            Center(
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: VideoPlayer(widget.controller!),
              ),
            ),

          // LAYER 3: Loading Indicator
          if (!widget.initialized)
            const Center(child: CircularProgressIndicator(color: Colors.white)),

          // LAYER 4: Play Icon
          if (widget.initialized &&
              (_isPausedByUser || !widget.controller!.value.isPlaying))
            const Center(
              child: Icon(Icons.play_arrow_rounded,
                  size: 60, color: Colors.white54),
            ),

          // LAYER 5: Info Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 15,
                right: 80,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      if (widget.post.avatarUrl != null &&
                          widget.post.avatarUrl != "")
                        CircleAvatar(
                          radius: 16,
                          backgroundImage:
                              CachedNetworkImageProvider(widget.post.avatarUrl),
                        ),
                      const SizedBox(width: 8),
                      Text(
                        "@${widget.post.username}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          shadows: [
                            Shadow(color: Colors.black54, blurRadius: 4)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.post.content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
