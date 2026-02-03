import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/emptyitem_widget.dart';
import '/components/groupddshimmer_widget.dart';
import '/components/groupshimer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'group_widget.dart' show GroupWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroupModel extends FlutterFlowModel<GroupWidget> {
  ///  Local state fields for this page.

  int? tab = 1;

  String? category;

  bool search = false;

  ///  State fields for stateful widgets in this page.

  Stream<List<GroupsWithMemberCountRow>>? conditionalBuilderSupabaseStream;
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
