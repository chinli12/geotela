import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'member_list_model.dart';
export 'member_list_model.dart';

/// Member List Overview
class MemberListWidget extends StatefulWidget {
  const MemberListWidget({
    super.key,
    required this.groupid,
    required this.count,
  });

  final String? groupid;
  final int? count;

  static String routeName = 'MemberList';
  static String routePath = '/memberList';

  @override
  State<MemberListWidget> createState() => _MemberListWidgetState();
}

class _MemberListWidgetState extends State<MemberListWidget> {
  late MemberListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MemberListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).backgroud,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(67.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).backgroud,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Frame_1261155275_(2).png',
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Frame_1261155274_(12).png',
                          width: 232.0,
                          height: 60.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (false)
                    Text(
                      FFLocalizations.of(context).getText(
                        '81w5e9b6' /* Moderators (2) */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            color: Color(0xFF374151),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  if (false)
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x1464748B),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: StreamBuilder<List<GroupMembersWithProfilesRow>>(
                          stream: _model.columnSupabaseStream ??= SupaFlow
                              .client
                              .from("group_members_with_profiles")
                              .stream(primaryKey: ['membership_id'])
                              .eqOrNull(
                                'group_id',
                                widget!.groupid,
                              )
                              .map((list) => list
                                  .map((item) =>
                                      GroupMembersWithProfilesRow(item))
                                  .toList()),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context)
                                          .mainBrandColorSuccessExploration,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<GroupMembersWithProfilesRow>
                                columnGroupMembersWithProfilesRowList =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnGroupMembersWithProfilesRowList.length,
                                  (columnIndex) {
                                final columnGroupMembersWithProfilesRow =
                                    columnGroupMembersWithProfilesRowList[
                                        columnIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzQ5NzA4NXww&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 40.0,
                                                height: 40.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'w6p5c3h2' /* Krushluv Doe */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.raleway(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText2,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).divide(SizedBox(height: 16.0)),
                            );
                          },
                        ),
                      ),
                    ),
                  Text(
                    'Members (${widget!.count?.toString()})',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: Color(0xFF374151),
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x1464748B),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: StreamBuilder<List<GroupMembersWithProfilesRow>>(
                      stream: _model.listViewSupabaseStream ??= SupaFlow.client
                          .from("group_members_with_profiles")
                          .stream(primaryKey: ['membership_id'])
                          .eqOrNull(
                            'group_id',
                            widget!.groupid,
                          )
                          .map((list) => list
                              .map((item) => GroupMembersWithProfilesRow(item))
                              .toList()),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context)
                                      .mainBrandColorSuccessExploration,
                                ),
                              ),
                            ),
                          );
                        }
                        List<GroupMembersWithProfilesRow>
                            listViewGroupMembersWithProfilesRowList =
                            snapshot.data!;

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              listViewGroupMembersWithProfilesRowList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewGroupMembersWithProfilesRow =
                                listViewGroupMembersWithProfilesRowList[
                                    listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                listViewGroupMembersWithProfilesRow
                                                    .profileImage,
                                                'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzQ5NzA4NXww&ixlib=rb-4.1.0&q=80&w=1080',
                                              ),
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              listViewGroupMembersWithProfilesRow
                                                  .username,
                                              'Krushluv Doe',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.raleway(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText2,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      FlutterFlowIconButton(
                                        borderRadius: 12.0,
                                        buttonSize: 30.0,
                                        icon: Icon(
                                          Icons.remove_circle,
                                          color: FlutterFlowTheme.of(context)
                                              .notificationsWarnings,
                                          size: 16.0,
                                        ),
                                        onPressed: () async {
                                          await GroupMembersTable().delete(
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              listViewGroupMembersWithProfilesRow
                                                  .membershipId,
                                            ),
                                          );
                                          safeSetState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 24.0))
                    .addToStart(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
