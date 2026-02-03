import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/emptyitem_widget.dart';
import '/components/eventload_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'event_listing_page_widget.dart' show EventListingPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventListingPageModel extends FlutterFlowModel<EventListingPageWidget> {
  ///  Local state fields for this page.

  String? catigory;

  int? tab = 1;

  bool search = false;

  ///  State fields for stateful widgets in this page.

  Stream<List<EventsRow>>? eventListingPageSupabaseStream;
  Stream<List<EventsRow>>? containerSupabaseStream1;
  Stream<List<EventsRow>>? conditionalBuilderSupabaseStream;
  Stream<List<EventsRow>>? containerSupabaseStream2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
