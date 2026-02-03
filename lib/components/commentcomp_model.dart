import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/commentcomp_widget.dart';
import '/components/commentshimmer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'commentcomp_widget.dart' show CommentcompWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommentcompModel extends FlutterFlowModel<CommentcompWidget> {
  ///  Local state fields for this component.

  int? commentindex;

  bool liked = false;

  bool isviewing = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in commentcomp widget.
  List<CommentLikesRow>? like;
  // Models for commentcomp dynamic component.
  FlutterFlowDynamicModels<CommentcompModel>? _commentcompModels;
  FlutterFlowDynamicModels<CommentcompModel> get commentcompModels =>
      _commentcompModels ??= FlutterFlowDynamicModels(() => CommentcompModel());

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentcompModels.dispose();
  }
}
