import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/component/nav/nav_widget.dart';
import '/components/emptyitem_widget.dart';
import '/components/eventatendee_widget.dart';
import '/components/mainpostcard_widget.dart';
import '/components/souce_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'community_widget.dart' show CommunityWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityModel extends FlutterFlowModel<CommunityWidget> {
  ///  Local state fields for this page.

  int limit = 20;

  int? offset = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetFeedPostsImage)] action in Community widget.
  ApiCallResponse? apiResultl0b;
  // Stores action output result for [Custom Action - mergePostsJson] action in Community widget.
  List<dynamic>? jsonpost;
  // Models for mainpostcard dynamic component.
  late FlutterFlowDynamicModels<MainpostcardModel> mainpostcardModels;
  // Model for Nav component.
  late NavModel navModel;
  Stream<List<PostsWithMetaVideoRow>>? rowSupabaseStream;

  /// Query cache managers for this widget.

  final _storiesManager = StreamRequestManager<List<PostsWithMetaVideoRow>>();
  Stream<List<PostsWithMetaVideoRow>> stories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostsWithMetaVideoRow>> Function() requestFn,
  }) =>
      _storiesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStoriesCache() => _storiesManager.clear();
  void clearStoriesCacheKey(String? uniqueKey) =>
      _storiesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    mainpostcardModels = FlutterFlowDynamicModels(() => MainpostcardModel());
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    mainpostcardModels.dispose();
    navModel.dispose();

    /// Dispose query cache managers for this widget.

    clearStoriesCache();
  }
}
