import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/component/cardsaved/cardsaved_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'story_map_widget.dart' show StoryMapWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class StoryMapModel extends FlutterFlowModel<StoryMapWidget> {
  ///  Local state fields for this page.

  bool serched = false;

  bool issave = false;

  bool showmap = false;

  LatLng? latlang;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in StoryMap widget.
  List<SavedPlacesRow>? storissave;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - uuidgen] action in Button widget.
  String? uuid;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SavedPlacesRow? save;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
