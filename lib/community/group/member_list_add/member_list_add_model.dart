import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'member_list_add_widget.dart' show MemberListAddWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MemberListAddModel extends FlutterFlowModel<MemberListAddWidget> {
  ///  Local state fields for this page.

  List<ProfilesRow> members = [];
  void addToMembers(ProfilesRow item) => members.add(item);
  void removeFromMembers(ProfilesRow item) => members.remove(item);
  void removeAtIndexFromMembers(int index) => members.removeAt(index);
  void insertAtIndexInMembers(int index, ProfilesRow item) =>
      members.insert(index, item);
  void updateMembersAtIndex(int index, Function(ProfilesRow) updateFn) =>
      members[index] = updateFn(members[index]);

  ///  State fields for stateful widgets in this page.

  Stream<List<ProfilesRow>>? listViewSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
