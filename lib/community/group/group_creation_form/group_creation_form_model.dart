import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'group_creation_form_widget.dart' show GroupCreationFormWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GroupCreationFormModel extends FlutterFlowModel<GroupCreationFormWidget> {
  ///  Local state fields for this page.

  int? index = 0;

  List<String> catigoris = [];
  void addToCatigoris(String item) => catigoris.add(item);
  void removeFromCatigoris(String item) => catigoris.remove(item);
  void removeAtIndexFromCatigoris(int index) => catigoris.removeAt(index);
  void insertAtIndexInCatigoris(int index, String item) =>
      catigoris.insert(index, item);
  void updateCatigorisAtIndex(int index, Function(String) updateFn) =>
      catigoris[index] = updateFn(catigoris[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDowncati widget.
  String? dropDowncatiValue;
  FormFieldController<String>? dropDowncatiValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading_uploadDataJh6 = false;
  FFUploadedFile uploadedLocalFile_uploadDataJh6 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJh6 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  GroupsRow? group;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
