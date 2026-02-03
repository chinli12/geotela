import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_list_view_model.dart';
export 'notification_list_view_model.dart';

class NotificationListViewWidget extends StatefulWidget {
  const NotificationListViewWidget({super.key});

  static String routeName = 'NotificationListView';
  static String routePath = '/notificationListView';

  @override
  State<NotificationListViewWidget> createState() =>
      _NotificationListViewWidgetState();
}

class _NotificationListViewWidgetState extends State<NotificationListViewWidget>
    with TickerProviderStateMixin {
  late NotificationListViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationListViewModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
          preferredSize: Size.fromHeight(100.0),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              60.0, 0.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/notificatiom.png',
                              width: 237.0,
                              height: 34.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
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
          child: Column(
            children: [
              Align(
                alignment: Alignment(0.0, 0),
                child: TabBar(
                  labelColor: FlutterFlowTheme.of(context).primaryText,
                  unselectedLabelColor:
                      FlutterFlowTheme.of(context).secondaryText,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.raleway(
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  unselectedLabelStyle: FlutterFlowTheme.of(context)
                      .titleMedium
                      .override(
                        font: GoogleFonts.raleway(
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                  indicatorColor: FlutterFlowTheme.of(context).secondrybtn,
                  tabs: [
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        '84y2vsym' /* All */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        'q5btx5hi' /* Unread */,
                      ),
                    ),
                    Tab(
                      text: FFLocalizations.of(context).getText(
                        '3hx113kv' /* Read */,
                      ),
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [() async {}, () async {}, () async {}][i]();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<NotificationsRow>>(
                                stream: _model.listViewSupabaseStream ??=
                                    SupaFlow.client
                                        .from("notifications")
                                        .stream(primaryKey: ['id'])
                                        .eqOrNull(
                                          'user_id',
                                          currentUserUid,
                                        )
                                        .order('created_at')
                                        .map((list) =>
                                            list
                                                .map((item) =>
                                                    NotificationsRow(item))
                                                .toList()),
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
                                  List<NotificationsRow>
                                      listViewNotificationsRowList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewNotificationsRowList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 0.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewNotificationsRow =
                                          listViewNotificationsRowList[
                                              listViewIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await NotificationsTable().update(
                                            data: {
                                              'reead': true,
                                            },
                                            matchingRows: (rows) =>
                                                rows.eqOrNull(
                                              'id',
                                              listViewNotificationsRow.id,
                                            ),
                                          );
                                          if (listViewNotificationsRow.post !=
                                                  null &&
                                              listViewNotificationsRow.post !=
                                                  '') {
                                            context.pushNamed(
                                              PostDetailsWidget.routeName,
                                              queryParameters: {
                                                'post': serializeParam(
                                                  listViewNotificationsRow.post,
                                                  ParamType.String,
                                                ),
                                                'from': serializeParam(
                                                  'noti',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            context.pushNamed(
                                              ChatWidget.routeName,
                                              queryParameters: {
                                                'conversation': serializeParam(
                                                  listViewNotificationsRow
                                                      .converstaion,
                                                  ParamType.String,
                                                ),
                                                'username': serializeParam(
                                                  listViewNotificationsRow
                                                      .senderUsername,
                                                  ParamType.String,
                                                ),
                                                'averter': serializeParam(
                                                  listViewNotificationsRow
                                                      .senderAvatar,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: listViewNotificationsRow
                                                        .reead ==
                                                    false
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : Color(0xFFF2F1F9),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      listViewNotificationsRow
                                                          .subject,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .raleway(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF374151),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        "relative",
                                                        listViewNotificationsRow
                                                            .createdAt!,
                                                        locale: FFLocalizations
                                                                    .of(context)
                                                                .languageShortCode ??
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .raleway(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF959595),
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    listViewNotificationsRow
                                                        .message,
                                                    'null',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.raleway(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF64748B),
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
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder<List<NotificationsRow>>(
                      future: NotificationsTable().queryRows(
                        queryFn: (q) => q
                            .eqOrNull(
                              'user_id',
                              currentUserUid,
                            )
                            .eqOrNull(
                              'reead',
                              false,
                            )
                            .order('created_at'),
                      ),
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
                        List<NotificationsRow> listViewNotificationsRowList =
                            snapshot.data!;

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewNotificationsRowList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 0.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewNotificationsRow =
                                listViewNotificationsRowList[listViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await NotificationsTable().update(
                                  data: {
                                    'reead': true,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    listViewNotificationsRow.id,
                                  ),
                                );
                                if (listViewNotificationsRow.post != null &&
                                    listViewNotificationsRow.post != '') {
                                  context.pushNamed(
                                    PostDetailsWidget.routeName,
                                    queryParameters: {
                                      'post': serializeParam(
                                        listViewNotificationsRow.post,
                                        ParamType.String,
                                      ),
                                      'from': serializeParam(
                                        'noti',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  context.pushNamed(
                                    ChatWidget.routeName,
                                    queryParameters: {
                                      'conversation': serializeParam(
                                        listViewNotificationsRow.converstaion,
                                        ParamType.String,
                                      ),
                                      'username': serializeParam(
                                        listViewNotificationsRow.senderUsername,
                                        ParamType.String,
                                      ),
                                      'averter': serializeParam(
                                        listViewNotificationsRow.senderAvatar,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listViewNotificationsRow.subject,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.raleway(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF374151),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            dateTimeFormat(
                                              "relative",
                                              listViewNotificationsRow
                                                  .createdAt!,
                                              locale: FFLocalizations.of(
                                                          context)
                                                      .languageShortCode ??
                                                  FFLocalizations.of(context)
                                                      .languageCode,
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
                                                  color: Color(0xFF959595),
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
                                        ],
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          listViewNotificationsRow.message,
                                          'null',
                                        ),
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
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    FutureBuilder<List<NotificationsRow>>(
                      future: NotificationsTable().queryRows(
                        queryFn: (q) => q
                            .eqOrNull(
                              'user_id',
                              currentUserUid,
                            )
                            .eqOrNull(
                              'reead',
                              true,
                            )
                            .order('created_at'),
                      ),
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
                        List<NotificationsRow> listViewNotificationsRowList =
                            snapshot.data!;

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewNotificationsRowList.length,
                          separatorBuilder: (_, __) => SizedBox(height: 0.0),
                          itemBuilder: (context, listViewIndex) {
                            final listViewNotificationsRow =
                                listViewNotificationsRowList[listViewIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (listViewNotificationsRow.post != null &&
                                    listViewNotificationsRow.post != '') {
                                  context.pushNamed(
                                    PostDetailsWidget.routeName,
                                    queryParameters: {
                                      'post': serializeParam(
                                        listViewNotificationsRow.post,
                                        ParamType.String,
                                      ),
                                      'from': serializeParam(
                                        'noti',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  context.pushNamed(
                                    ChatWidget.routeName,
                                    queryParameters: {
                                      'conversation': serializeParam(
                                        listViewNotificationsRow.id,
                                        ParamType.String,
                                      ),
                                      'username': serializeParam(
                                        listViewNotificationsRow.senderUsername,
                                        ParamType.String,
                                      ),
                                      'averter': serializeParam(
                                        listViewNotificationsRow.senderAvatar,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2F1F9),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listViewNotificationsRow.subject,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.raleway(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF374151),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            dateTimeFormat(
                                              "relative",
                                              listViewNotificationsRow
                                                  .createdAt!,
                                              locale: FFLocalizations.of(
                                                          context)
                                                      .languageShortCode ??
                                                  FFLocalizations.of(context)
                                                      .languageCode,
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
                                                  color: Color(0xFF959595),
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
                                        ],
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          listViewNotificationsRow.message,
                                          'null',
                                        ),
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
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
