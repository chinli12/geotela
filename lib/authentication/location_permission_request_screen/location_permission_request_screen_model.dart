import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'location_permission_request_screen_widget.dart'
    show LocationPermissionRequestScreenWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LocationPermissionRequestScreenModel
    extends FlutterFlowModel<LocationPermissionRequestScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (location)] action in Button widget.
  ApiCallResponse? location;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ProfilesRow>? userreg;
  // Stores action output result for [Backend Call - API (location)] action in Button widget.
  ApiCallResponse? local;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ProfilesRow>? userapple;
  // Stores action output result for [Backend Call - API (location)] action in Button widget.
  ApiCallResponse? loc;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ProfilesRow>? usergoogle;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
