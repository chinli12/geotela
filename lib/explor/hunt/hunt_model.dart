import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'hunt_widget.dart' show HuntWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class HuntModel extends FlutterFlowModel<HuntWidget> {
  ///  Local state fields for this page.

  List<HuntStruct> hunt = [];
  void addToHunt(HuntStruct item) => hunt.add(item);
  void removeFromHunt(HuntStruct item) => hunt.remove(item);
  void removeAtIndexFromHunt(int index) => hunt.removeAt(index);
  void insertAtIndexInHunt(int index, HuntStruct item) =>
      hunt.insert(index, item);
  void updateHuntAtIndex(int index, Function(HuntStruct) updateFn) =>
      hunt[index] = updateFn(hunt[index]);

  String? category;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (geminigethunt)] action in Hunt widget.
  ApiCallResponse? apiResultds3;
  // Stores action output result for [Custom Action - parsehuntJson] action in Hunt widget.
  List<HuntStruct>? hunts;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
