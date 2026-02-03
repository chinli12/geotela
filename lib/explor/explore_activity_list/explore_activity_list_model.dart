import '/component/nav/nav_widget.dart';
import '/components/storycomponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'explore_activity_list_widget.dart' show ExploreActivityListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExploreActivityListModel
    extends FlutterFlowModel<ExploreActivityListWidget> {
  ///  Local state fields for this page.

  bool search = false;

  String? catigory;

  bool isfeaching = false;

  ///  State fields for stateful widgets in this page.

  // Models for storycomponent dynamic component.
  late FlutterFlowDynamicModels<StorycomponentModel> storycomponentModels;
  // Model for Nav component.
  late NavModel navModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    storycomponentModels =
        FlutterFlowDynamicModels(() => StorycomponentModel());
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    storycomponentModels.dispose();
    navModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
