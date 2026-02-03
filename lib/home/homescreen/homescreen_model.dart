import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/component/nav/nav_widget.dart';
import '/components/storycomponent_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'homescreen_widget.dart' show HomescreenWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class HomescreenModel extends FlutterFlowModel<HomescreenWidget> {
  ///  Local state fields for this page.

  bool? isfecthing = false;

  bool newLocation = false;

  dynamic storie;

  List<LatLng> latLang = [];
  void addToLatLang(LatLng item) => latLang.add(item);
  void removeFromLatLang(LatLng item) => latLang.remove(item);
  void removeAtIndexFromLatLang(int index) => latLang.removeAt(index);
  void insertAtIndexInLatLang(int index, LatLng item) =>
      latLang.insert(index, item);
  void updateLatLangAtIndex(int index, Function(LatLng) updateFn) =>
      latLang[index] = updateFn(latLang[index]);

  bool showmap = true;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkLocationUpdate] action in Homescreen widget.
  String? statuseREQUEST;
  // Stores action output result for [Backend Call - Query Rows] action in Homescreen widget.
  List<StoriesRow>? storis;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (location)] action in Homescreen widget.
  ApiCallResponse? locat33;
  // Stores action output result for [Backend Call - API (location)] action in Homescreen widget.
  ApiCallResponse? locat;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for storycomponent component.
  late StorycomponentModel storycomponentModel1;
  // Models for storycomponent dynamic component.
  late FlutterFlowDynamicModels<StorycomponentModel> storycomponentModels2;
  Stream<List<StoryRequestsRow>>? containerSupabaseStream;
  // Model for Nav component.
  late NavModel navModel;
  // Stores action output result for [Backend Call - Query Rows] action in Stack widget.
  List<AIChatRow>? cht;
  // Stores action output result for [Backend Call - Insert Row] action in Stack widget.
  AIChatRow? chatnew;

  @override
  void initState(BuildContext context) {
    storycomponentModel1 = createModel(context, () => StorycomponentModel());
    storycomponentModels2 =
        FlutterFlowDynamicModels(() => StorycomponentModel());
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    storycomponentModel1.dispose();
    storycomponentModels2.dispose();
    navModel.dispose();
  }
}
