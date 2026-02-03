import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/commentcomp_widget.dart';
import '/components/eventatendee_widget.dart';
import '/components/mainpostcard_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'post_details_widget.dart' show PostDetailsWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostDetailsModel extends FlutterFlowModel<PostDetailsWidget> {
  ///  Local state fields for this page.

  dynamic post;

  ///  State fields for stateful widgets in this page.

  // Model for mainpostcard component.
  late MainpostcardModel mainpostcardModel;
  // Models for commentcomp dynamic component.
  FlutterFlowDynamicModels<CommentcompModel>? _commentcompModels;
  FlutterFlowDynamicModels<CommentcompModel> get commentcompModels =>
      _commentcompModels ??= FlutterFlowDynamicModels(() => CommentcompModel());

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<CommentsWithMetaRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    mainpostcardModel = createModel(context, () => MainpostcardModel());
  }

  @override
  void dispose() {
    mainpostcardModel.dispose();
    commentcompModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
