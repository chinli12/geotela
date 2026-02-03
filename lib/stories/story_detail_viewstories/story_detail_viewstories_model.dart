import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'story_detail_viewstories_widget.dart' show StoryDetailViewstoriesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class StoryDetailViewstoriesModel
    extends FlutterFlowModel<StoryDetailViewstoriesWidget> {
  ///  Local state fields for this page.

  String playindex = 'paused';

  bool hasquiz = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in storyDetailViewstories widget.
  List<QuizResultsRow>? quiz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
