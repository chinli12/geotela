import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/component/postcard/postcard_widget.dart';
import '/component/postcardshimer/postcardshimer_widget.dart';
import '/components/btnjoingroup_widget.dart';
import '/components/eventatendee_widget.dart';
import '/components/report_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'group_overview_model.dart';
export 'group_overview_model.dart';

/// Community Group Overview
class GroupOverviewWidget extends StatefulWidget {
  const GroupOverviewWidget({
    super.key,
    required this.group,
  });

  final GroupsWithMemberCountRow? group;

  static String routeName = 'GroupOverview';
  static String routePath = '/groupOverview';

  @override
  State<GroupOverviewWidget> createState() => _GroupOverviewWidgetState();
}

class _GroupOverviewWidgetState extends State<GroupOverviewWidget> {
  late GroupOverviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupOverviewModel());

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
        floatingActionButton: Visibility(
          visible: widget!.group?.isMember ?? true,
          child: FloatingActionButton(
            onPressed: () async {
              context.pushNamed(
                PostCreationWidget.routeName,
                queryParameters: {
                  'groupID': serializeParam(
                    widget!.group,
                    ParamType.SupabaseRow,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.bottomToTop,
                  ),
                },
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      valueOrDefault<String>(
                        widget!.group?.imageUrl,
                        'https://images.unsplash.com/photo-1551908222-0b03b185b98a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxiZWF1dGlmdWwlMjBvY2VhbnxlbnwwfHx8fDE3NjM1MDQwNDB8MA&ixlib=rb-4.1.0&q=80&w=1080',
                      ),
                    ).image,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 52.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed(GroupWidget.routeName);
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0x1A64748B),
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0x1A64748B),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showAlignedDialog(
                                      context: context,
                                      isGlobal: false,
                                      avoidOverflow: true,
                                      targetAnchor: AlignmentDirectional(
                                              -1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              -1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Container(
                                              height: 300.0,
                                              width: 200.0,
                                              child: ReportWidget(
                                                type:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'v1kxzbd3' /* Group */,
                                                ),
                                                actiontype: 'Group Action',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x1A64748B),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget!.group?.name,
                        'Fortnite Hiking',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: Color(0xFF374151),
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FutureBuilder<List<GroupMembersWithProfilesRow>>(
                                future:
                                    GroupMembersWithProfilesTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'group_id',
                                    widget!.group?.id,
                                  ),
                                  limit: 4,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return EventatendeeWidget();
                                  }
                                  List<GroupMembersWithProfilesRow>
                                      rowGroupMembersWithProfilesRowList =
                                      snapshot.data!;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowGroupMembersWithProfilesRowList
                                            .length, (rowIndex) {
                                      final rowGroupMembersWithProfilesRow =
                                          rowGroupMembersWithProfilesRowList[
                                              rowIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            ProfilesuserWidget.routeName,
                                            queryParameters: {
                                              'userid': serializeParam(
                                                rowGroupMembersWithProfilesRow
                                                    .userId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .bottomToTop,
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                valueOrDefault<String>(
                                                  rowGroupMembersWithProfilesRow
                                                      .profileImage,
                                                  'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzQ5NzA4NXww&ixlib=rb-4.1.0&q=80&w=1080',
                                                ),
                                              ).image,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      );
                                    }).divide(SizedBox(width: -8.0)),
                                  );
                                },
                              ),
                              Expanded(
                                child: Text(
                                  '${formatNumber(
                                    widget!.group?.memberCount,
                                    formatType: FormatType.compact,
                                  )} Members',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF64748B),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0x1A64748B),
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.share,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText2,
                                  size: 16.0,
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (widget!.group?.createdBy !=
                                    currentUserUid) {
                                  return FutureBuilder<List<GroupMembersRow>>(
                                    future: GroupMembersTable().querySingleRow(
                                      queryFn: (q) => q
                                          .eqOrNull(
                                            'group_id',
                                            widget!.group?.id,
                                          )
                                          .eqOrNull(
                                            'user_id',
                                            currentUserUid,
                                          ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return BtnjoingroupWidget();
                                      }
                                      List<GroupMembersRow>
                                          containerGroupMembersRowList =
                                          snapshot.data!;

                                      final containerGroupMembersRow =
                                          containerGroupMembersRowList
                                                  .isNotEmpty
                                              ? containerGroupMembersRowList
                                                  .first
                                              : null;

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (containerGroupMembersRow?.id !=
                                                  null &&
                                              containerGroupMembersRow?.id !=
                                                  '') {
                                            await GroupMembersTable().delete(
                                              matchingRows: (rows) => rows
                                                  .eqOrNull(
                                                    'group_id',
                                                    widget!.group?.id,
                                                  )
                                                  .eqOrNull(
                                                    'user_id',
                                                    currentUserUid,
                                                  ),
                                            );
                                            safeSetState(() {});
                                          } else {
                                            await GroupMembersTable().insert({
                                              'group_id': widget!.group?.id,
                                              'user_id': currentUserUid,
                                              'created_at':
                                                  supaSerialize<DateTime>(
                                                      getCurrentTimestamp),
                                            });
                                            safeSetState(() {});
                                          }
                                        },
                                        child: Container(
                                          width: 60.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8ACE42),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  containerGroupMembersRow
                                                                  ?.id !=
                                                              null &&
                                                          containerGroupMembersRow
                                                                  ?.id !=
                                                              ''
                                                      ? 'Joined'
                                                      : 'Join',
                                                  'Join',
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
                                                      color: Colors.white,
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
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.grpup =
                                          await GroupsTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
                                          widget!.group?.id,
                                        ),
                                      );
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        GroupEditFormWidget.routeName,
                                        queryParameters: {
                                          'group': serializeParam(
                                            _model.grpup?.firstOrNull,
                                            ParamType.SupabaseRow,
                                          ),
                                        }.withoutNulls,
                                      );

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: 60.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x7B64748B),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '4ap7re44' /* Edit */,
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
                                                  color: Colors.white,
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
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ].divide(SizedBox(width: 5.0)),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget!.group?.description,
                        'Welcome to Fortnite Hiking Lorem ipsum dolor sit amet, consectetur adipiscin elit. Sed do eiusmod tempor Lorem ipsum dolor sit...',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF64748B),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 40.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.tab = 1;
                              safeSetState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'pi8unh35' /* Posts */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF374151),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                if (_model.tab == 1)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3A220),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.tab = 2;
                              safeSetState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'fi9b714g' /* About */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF64748B),
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                if (_model.tab == 2)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 2.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3A220),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(width: 48.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
              Builder(
                builder: (context) {
                  if (_model.tab == 1) {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: StreamBuilder<List<PostsWithMetaImagesRow>>(
                        stream: _model.listViewSupabaseStream ??= SupaFlow
                            .client
                            .from("posts_with_meta_images")
                            .stream(primaryKey: ['id'])
                            .eqOrNull(
                              'groupid',
                              widget!.group?.id,
                            )
                            .map((list) => list
                                .map((item) => PostsWithMetaImagesRow(item))
                                .toList()),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return PostcardshimerWidget();
                          }
                          List<PostsWithMetaImagesRow>
                              listViewPostsWithMetaImagesRowList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                listViewPostsWithMetaImagesRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewPostsWithMetaImagesRow =
                                  listViewPostsWithMetaImagesRowList[
                                      listViewIndex];
                              return wrapWithModel(
                                model: _model.postcardModels.getModel(
                                  listViewPostsWithMetaImagesRow.id!,
                                  listViewIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: PostcardWidget(
                                  key: Key(
                                    'Keyj0v_${listViewPostsWithMetaImagesRow.id!}',
                                  ),
                                  title:
                                      listViewPostsWithMetaImagesRow.location!,
                                  useimage:
                                      listViewPostsWithMetaImagesRow.avatarUrl!,
                                  description:
                                      listViewPostsWithMetaImagesRow.content!,
                                  time: valueOrDefault<String>(
                                    dateTimeFormat(
                                      "relative",
                                      listViewPostsWithMetaImagesRow.createdAt,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '2hr',
                                  ),
                                  image:
                                      listViewPostsWithMetaImagesRow.mediaUrl!,
                                  likecount:
                                      listViewPostsWithMetaImagesRow.likeCount!,
                                  commentcount: listViewPostsWithMetaImagesRow
                                      .commentCount!,
                                  sharecount: 0,
                                  id: listViewPostsWithMetaImagesRow.id!,
                                  liks: listViewPostsWithMetaImagesRow
                                      .likedUserIds,
                                  posts: listViewPostsWithMetaImagesRow,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'h6iw9z8i' /* Group Info */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText2,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.group?.description,
                                  'Share what you are working on and places you’ve been to Lorem ipsum dolor sit amet, consectetur adipiscin elit. Sed do tempor Lorem ipsum dolor sit...',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText2,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                          Builder(
                            builder: (context) {
                              final permision =
                                  widget!.group?.permision?.toList() ?? [];

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: permision.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 20.0),
                                itemBuilder: (context, permisionIndex) {
                                  final permisionItem =
                                      permision[permisionIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (permisionItem ==
                                              'Only community member can post like or share') {
                                            return Icon(
                                              FFIcons.kusersThin,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 24.0,
                                            );
                                          } else if (permisionItem ==
                                              'Members can send new message') {
                                            return Icon(
                                              FFIcons.kglobeHemisphereEast,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 24.0,
                                            );
                                          } else {
                                            return Icon(
                                              FFIcons.kglobeHemisphereEast,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 24.0,
                                            );
                                          }
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          valueOrDefault<String>(
                                            permisionItem,
                                            'Only community members can post, like, or reply',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.raleway(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText2,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  );
                                },
                              );
                            },
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kcalendarDot,
                                color: FlutterFlowTheme.of(context)
                                    .mainBrandColorSuccessExploration,
                                size: 24.0,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '9s282fmh' /* Created  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.raleway(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText2,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: dateTimeFormat(
                                            "MMMMEEEEd",
                                            widget!.group!.createdAt!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.raleway(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText2,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  FutureBuilder<List<ProfilesRow>>(
                                    future: ProfilesTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        widget!.group?.createdBy,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .mainBrandColorSuccessExploration,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProfilesRow>
                                          richTextProfilesRowList =
                                          snapshot.data!;

                                      final richTextProfilesRow =
                                          richTextProfilesRowList.isNotEmpty
                                              ? richTextProfilesRowList.first
                                              : null;

                                      return RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '7yfkke7a' /* By */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.raleway(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
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
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                richTextProfilesRow?.username,
                                                'username',
                                              ),
                                              style: TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.raleway(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText2,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ap815xmm' /* Moderators */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText2,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '2vdx0z6f' /* 1 Moderators */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText2,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '3q95klak' /* Members */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText2,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    MemberListWidget.routeName,
                                    queryParameters: {
                                      'groupid': serializeParam(
                                        widget!.group?.id,
                                        ParamType.String,
                                      ),
                                      'count': serializeParam(
                                        widget!.group?.memberCount,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.bottomToTop,
                                      ),
                                    },
                                  );
                                },
                                child: Text(
                                  '${formatNumber(
                                    widget!.group?.memberCount,
                                    formatType: FormatType.compact,
                                  )}${widget!.group!.memberCount! >= 1 ? 'Members' : 'Member'}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText2,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ]
                            .divide(SizedBox(height: 20.0))
                            .addToEnd(SizedBox(height: 100.0)),
                      ),
                    );
                  }
                },
              ),
            ].divide(SizedBox(height: 16.0)).addToStart(SizedBox(height: 0.0)),
          ),
        ),
      ),
    );
  }
}
