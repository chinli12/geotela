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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'reals_model.dart';
export 'reals_model.dart';

class RealsWidget extends StatefulWidget {
  const RealsWidget({
    super.key,
    int? nextindex,
    required this.postID,
  }) : this.nextindex = nextindex ?? 0;

  final int nextindex;
  final String? postID;

  static String routeName = 'Reals';
  static String routePath = '/reals';

  @override
  State<RealsWidget> createState() => _RealsWidgetState();
}

class _RealsWidgetState extends State<RealsWidget> {
  late RealsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RealsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.like = await LikesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'post_id',
              FFAppState().activeVideoPost.id,
            )
            .eqOrNull(
              'user_id',
              currentUserUid,
            ),
      );
      if (_model.like != null && (_model.like)!.isNotEmpty) {
        _model.isliked = true;
        safeSetState(() {});
      } else {
        _model.isliked = false;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<PostsWithMetaVideoRow>>(
      stream: _model.realsSupabaseStream ??= SupaFlow.client
          .from("posts_with_meta_video")
          .stream(primaryKey: ['id'])
          .order('created_at')
          .map((list) =>
              list.map((item) => PostsWithMetaVideoRow(item)).toList()),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            body: Center(
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
            ),
          );
        }
        List<PostsWithMetaVideoRow> realsPostsWithMetaVideoRowList =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.TikTokFeed(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    videoRows: realsPostsWithMetaVideoRowList,
                    initialIndex: widget!.nextindex,
                    initialPostId: widget!.postID,
                    onPageChanged: () async {
                      _model.likes = await LikesTable().queryRows(
                        queryFn: (q) => q
                            .eqOrNull(
                              'post_id',
                              FFAppState().activeVideoPost.id,
                            )
                            .eqOrNull(
                              'user_id',
                              currentUserUid,
                            ),
                      );
                      if (_model.likes != null && (_model.likes)!.isNotEmpty) {
                        _model.isliked = true;
                        safeSetState(() {});
                      } else {
                        _model.isliked = false;
                        safeSetState(() {});
                      }

                      safeSetState(() {});

                      safeSetState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10.0,
                                  sigmaY: 10.0,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context
                                        .pushNamed(CommunityWidget.routeName);
                                  },
                                  child: Container(
                                    width: 60.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x0FFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33545252),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    child: Icon(
                                      FFIcons.kcaretLeft,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(
                                width: 160.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0x0FFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33545252),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '9yydatdq' /* Reels */,
                                      ),
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
                                                .secondaryBackground,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 10.0,
                                  sigmaY: 10.0,
                                ),
                                child: Container(
                                  width: 60.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x0FFFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33545252),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SouceWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Icon(
                                      FFIcons.kimagesSquareThin,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Builder(
                              builder: (context) {
                                if (_model.isliked) {
                                  return FlutterFlowIconButton(
                                    borderRadius: 99999.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.favorite,
                                      color: FlutterFlowTheme.of(context)
                                          .notificationsWarnings,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await LikesTable().delete(
                                        matchingRows: (rows) => rows
                                            .eqOrNull(
                                              'post_id',
                                              FFAppState().activeVideoPost.id,
                                            )
                                            .eqOrNull(
                                              'user_id',
                                              currentUserUid,
                                            ),
                                      );
                                      _model.isliked = false;
                                      safeSetState(() {});
                                    },
                                  );
                                } else {
                                  return FlutterFlowIconButton(
                                    borderRadius: 99999.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 27.0,
                                    ),
                                    onPressed: () async {
                                      await LikesTable().insert({
                                        'post_id':
                                            FFAppState().activeVideoPost.id,
                                        'user_id': currentUserUid,
                                      });
                                      _model.isliked = true;
                                      safeSetState(() {});
                                    },
                                  );
                                }
                              },
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 9999.0,
                              buttonSize: 60.0,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              icon: Icon(
                                FFIcons.kmessengerLogo,
                                color: FlutterFlowTheme.of(context).info,
                                size: 27.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).backgroud,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: 700.0,
                                          child: CommentpostWidget(
                                            post:
                                                FFAppState().activeVideoPost.id,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                            Builder(
                              builder: (context) => FlutterFlowIconButton(
                                borderRadius: 9999.0,
                                buttonSize: 60.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).alternate,
                                icon: Icon(
                                  FFIcons.kshareNetwork,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await Share.share(
                                    getCurrentRoute(context),
                                    sharePositionOrigin:
                                        getWidgetBoundingBox(context),
                                  );
                                },
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 12.0))
                              .addToEnd(SizedBox(height: 100.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
