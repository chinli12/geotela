import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/eventatendee_widget.dart';
import '/components/joineventbtn_widget.dart';
import '/components/report_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'event_details_overview_widget.dart' show EventDetailsOverviewWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventDetailsOverviewModel
    extends FlutterFlowModel<EventDetailsOverviewWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<EventAttendeesWithProfilesRow>>? rowSupabaseStream;
  Stream<List<EventAttendeesWithProfilesRow>>? textSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
