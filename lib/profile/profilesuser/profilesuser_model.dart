import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/card_widget.dart';
import '/components/emptyitem_widget.dart';
import '/components/mainpostcard_widget.dart';
import '/components/message_widget.dart';
import '/components/profiledetailscomp_widget.dart';
import '/components/report_widget.dart';
import '/components/souce_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'profilesuser_widget.dart' show ProfilesuserWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilesuserModel extends FlutterFlowModel<ProfilesuserWidget> {
  ///  Local state fields for this page.

  int tab = 1;

  String? username;

  int? limit = 2;

  List<String> users = [];
  void addToUsers(String item) => users.add(item);
  void removeFromUsers(String item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, String item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(String) updateFn) =>
      users[index] = updateFn(users[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Profilesuser widget.
  List<ProfilesWithCountsRow>? user;
  // Models for mainpostcard dynamic component.
  late FlutterFlowDynamicModels<MainpostcardModel> mainpostcardModels;
  Completer<List<ProfileWithCountsRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<FollowersRow>? follwer;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ConversationsRow? conversation;

  @override
  void initState(BuildContext context) {
    mainpostcardModels = FlutterFlowDynamicModels(() => MainpostcardModel());
  }

  @override
  void dispose() {
    mainpostcardModels.dispose();
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
