import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'storycomponent_widget.dart' show StorycomponentWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StorycomponentModel extends FlutterFlowModel<StorycomponentWidget> {
  ///  Local state fields for this component.

  bool isave = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in storycomponent widget.
  List<SavedPlacesRow>? storissave;
  // Stores action output result for [Custom Action - uuidgen] action in Container widget.
  String? uuid;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  SavedPlacesRow? save;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
