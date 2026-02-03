import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'huntcard_widget.dart' show HuntcardWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HuntcardModel extends FlutterFlowModel<HuntcardWidget> {
  ///  Local state fields for this component.

  bool istated = false;

  List<String> completed = [];
  void addToCompleted(String item) => completed.add(item);
  void removeFromCompleted(String item) => completed.remove(item);
  void removeAtIndexFromCompleted(int index) => completed.removeAt(index);
  void insertAtIndexInCompleted(int index, String item) =>
      completed.insert(index, item);
  void updateCompletedAtIndex(int index, Function(String) updateFn) =>
      completed[index] = updateFn(completed[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
