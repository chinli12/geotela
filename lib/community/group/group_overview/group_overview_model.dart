import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/component/postcard/postcard_widget.dart';
import '/component/postcardshimer/postcardshimer_widget.dart';
import '/components/btnjoingroup_widget.dart';
import '/components/eventatendee_widget.dart';
import '/components/report_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'group_overview_widget.dart' show GroupOverviewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroupOverviewModel extends FlutterFlowModel<GroupOverviewWidget> {
  ///  Local state fields for this page.

  int? tab = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<GroupsRow>? grpup;
  Stream<List<PostsWithMetaImagesRow>>? listViewSupabaseStream;
  // Models for postcard dynamic component.
  late FlutterFlowDynamicModels<PostcardModel> postcardModels;

  @override
  void initState(BuildContext context) {
    postcardModels = FlutterFlowDynamicModels(() => PostcardModel());
  }

  @override
  void dispose() {
    postcardModels.dispose();
  }
}
