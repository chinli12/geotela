import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'event_creation_form_widget.dart' show EventCreationFormWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventCreationFormModel extends FlutterFlowModel<EventCreationFormWidget> {
  ///  Local state fields for this page.

  List<String> catigory = [];
  void addToCatigory(String item) => catigory.add(item);
  void removeFromCatigory(String item) => catigory.remove(item);
  void removeAtIndexFromCatigory(int index) => catigory.removeAt(index);
  void insertAtIndexInCatigory(int index, String item) =>
      catigory.insert(index, item);
  void updateCatigoryAtIndex(int index, Function(String) updateFn) =>
      catigory[index] = updateFn(catigory[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDowncat widget.
  String? dropDowncatValue;
  FormFieldController<String>? dropDowncatValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  bool isDataUploading_uploadData26eg = false;
  FFUploadedFile uploadedLocalFile_uploadData26eg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData26eg = '';

  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  EventsRow? event;

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
