import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/component/tripshima1/tripshima1_widget.dart';
import '/component/tripshimma/tripshimma_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'trip_widget.dart' show TripWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class TripModel extends FlutterFlowModel<TripWidget> {
  ///  Local state fields for this page.

  int tab = 1;

  int index = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Insert Row] action in Trip widget.
  TripPlansRow? tripcrated;
  Stream<List<TripPlansWithLocationCountsAndCompletedRow>>? rowSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
