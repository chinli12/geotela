import '/backend/api_requests/api_calls.dart';
import '/components/storycomponent_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  bool isfeching = false;

  bool dataready = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (geministories)] action in GoogleMap widget.
  ApiCallResponse? apiResult3rf;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue1 = FFPlace();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue2 = FFPlace();
  // Models for storycomponent dynamic component.
  late FlutterFlowDynamicModels<StorycomponentModel> storycomponentModels;

  @override
  void initState(BuildContext context) {
    storycomponentModels =
        FlutterFlowDynamicModels(() => StorycomponentModel());
  }

  @override
  void dispose() {
    storycomponentModels.dispose();
  }
}
