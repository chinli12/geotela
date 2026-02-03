import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'story_detail_view_focuse_widget.dart' show StoryDetailViewFocuseWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoryDetailViewFocuseModel
    extends FlutterFlowModel<StoryDetailViewFocuseWidget> {
  ///  Local state fields for this page.

  bool playing = false;

  bool issaved = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in storyDetailViewFocuse widget.
  List<SavedPlacesRow>? storis;
  // Stores action output result for [Custom Action - uuidgen] action in Container widget.
  String? uuid;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  SavedPlacesRow? save;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
