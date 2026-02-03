import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'interest_selection_interface_widget.dart'
    show InterestSelectionInterfaceWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InterestSelectionInterfaceModel
    extends FlutterFlowModel<InterestSelectionInterfaceWidget> {
  ///  Local state fields for this page.

  List<String> selectedintrst = [];
  void addToSelectedintrst(String item) => selectedintrst.add(item);
  void removeFromSelectedintrst(String item) => selectedintrst.remove(item);
  void removeAtIndexFromSelectedintrst(int index) =>
      selectedintrst.removeAt(index);
  void insertAtIndexInSelectedintrst(int index, String item) =>
      selectedintrst.insert(index, item);
  void updateSelectedintrstAtIndex(int index, Function(String) updateFn) =>
      selectedintrst[index] = updateFn(selectedintrst[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
