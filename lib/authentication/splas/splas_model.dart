import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'splas_widget.dart' show SplasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplasModel extends FlutterFlowModel<SplasWidget> {
  ///  Local state fields for this page.

  String? information;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (location)] action in splas widget.
  ApiCallResponse? apiResultqx1xCopy;
  // Stores action output result for [Backend Call - API (GetLocationimage)] action in splas widget.
  ApiCallResponse? apiResultpq7;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
