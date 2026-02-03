import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/component/nav/nav_widget.dart';
import '/components/card_widget.dart';
import '/components/emptyitem_widget.dart';
import '/components/mainpostcard_widget.dart';
import '/components/profiledetailscomp_widget.dart';
import '/components/souce_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'dart:async';
import 'profiles_widget.dart' show ProfilesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilesModel extends FlutterFlowModel<ProfilesWidget> {
  ///  Local state fields for this page.

  int tab = 1;

  String? username;

  int? limit = 2;

  ///  State fields for stateful widgets in this page.

  // Models for mainpostcard dynamic component.
  late FlutterFlowDynamicModels<MainpostcardModel> mainpostcardModels;
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Model for Nav component.
  late NavModel navModel;

  /// Query cache managers for this widget.

  final _uservideManager = FutureRequestManager<List<PostsWithMetaVideoRow>>();
  Future<List<PostsWithMetaVideoRow>> uservide({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostsWithMetaVideoRow>> Function() requestFn,
  }) =>
      _uservideManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUservideCache() => _uservideManager.clear();
  void clearUservideCacheKey(String? uniqueKey) =>
      _uservideManager.clearRequest(uniqueKey);

  final _profilepageManager =
      FutureRequestManager<List<ProfilesWithCountsRow>>();
  Future<List<ProfilesWithCountsRow>> profilepage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProfilesWithCountsRow>> Function() requestFn,
  }) =>
      _profilepageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfilepageCache() => _profilepageManager.clear();
  void clearProfilepageCacheKey(String? uniqueKey) =>
      _profilepageManager.clearRequest(uniqueKey);

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

    clearUservideCache();

    clearProfilepageCache();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
