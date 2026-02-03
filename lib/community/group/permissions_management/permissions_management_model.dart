import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'permissions_management_widget.dart' show PermissionsManagementWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PermissionsManagementModel
    extends FlutterFlowModel<PermissionsManagementWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkboxonly widget.
  bool? checkboxonlyValue;
  // State field(s) for Checkboxmember widget.
  bool? checkboxmemberValue;
  // State field(s) for Checkboxadd widget.
  bool? checkboxaddValue;
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
