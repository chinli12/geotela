import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/commentpost_widget.dart';
import '/components/souce_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'reals_widget.dart' show RealsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class RealsModel extends FlutterFlowModel<RealsWidget> {
  ///  Local state fields for this page.

  int? idex;

  String? postid;

  String? mediurl;

  String? username;

  String? content;

  String? userimage;

  int indexvideo = 0;

  bool isliked = true;

  ///  State fields for stateful widgets in this page.

  Stream<List<PostsWithMetaVideoRow>>? realsSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in Reals widget.
  List<LikesRow>? like;
  // Stores action output result for [Backend Call - Query Rows] action in TikTokFeed widget.
  List<LikesRow>? likes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
