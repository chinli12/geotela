import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'story_detail_view_model.dart';
export 'story_detail_view_model.dart';

class StoryDetailViewWidget extends StatefulWidget {
  const StoryDetailViewWidget({
    super.key,
    required this.stories,
    String? from,
    this.id,
  }) : this.from = from ?? 'home';

  final dynamic stories;
  final String from;
  final String? id;

  static String routeName = 'storyDetailView';
  static String routePath = '/storyDetailView';

  @override
  State<StoryDetailViewWidget> createState() => _StoryDetailViewWidgetState();
}

class _StoryDetailViewWidgetState extends State<StoryDetailViewWidget> {
  late StoryDetailViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryDetailViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.storis = await SavedPlacesTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'user_id',
                  currentUserUid,
                )
                .eqOrNull(
                  'name',
                  getJsonField(
                    widget!.stories,
                    r'''$.title''',
                  ).toString(),
                ),
          );
          if (_model.storis != null && (_model.storis)!.isNotEmpty) {
            _model.issave = true;
          }
        }),
        Future(() async {
          _model.quiz = await QuizResultsTable().queryRows(
            queryFn: (q) => q
                .eqOrNull(
                  'user_id',
                  currentUserUid,
                )
                .eqOrNull(
                  'story_title',
                  getJsonField(
                    widget!.stories,
                    r'''$.title''',
                  ).toString(),
                ),
          );
          if (_model.quiz != null && (_model.quiz)!.isNotEmpty) {
            _model.hasquiz = true;
          } else {
            _model.hasquiz = false;
          }
        }),
      ]);
      safeSetState(() {});
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
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            await actions.speak(
                              'newffff',
                              true,
                            );
                            _model.playing = false;
                            safeSetState(() {});
                            if (widget!.from == 'home') {
                              context.goNamed(HomescreenWidget.routeName);
                            } else if (widget!.from == 'explo') {
                              context
                                  .goNamed(ExploreActivityListWidget.routeName);
                            } else if (widget!.from == 'search') {
                              context.pushNamed(SearchWidget.routeName);
                            } else {
                              context
                                  .goNamed(PlacesToExploreListWidget.routeName);
                            }
                          },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/Frame_1261155275_(2).png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await actions.speak(
                              'newffff',
                              true,
                            );
                            _model.playing = false;
                            safeSetState(() {});

                            context.pushNamed(
                              StoryDetailViewFocuseWidget.routeName,
                              queryParameters: {
                                'stories': serializeParam(
                                  widget!.stories,
                                  ParamType.JSON,
                                ),
                                'from': serializeParam(
                                  widget!.from,
                                  ParamType.String,
                                ),
                                'id': serializeParam(
                                  widget!.id,
                                  ParamType.String,
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
                          child: Container(
                            width: 150.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/Frame_1261155274_(1).png',
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 160.0),
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              child:
                                                  FlutterFlowExpandedImageView(
                                                image: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl: getJsonField(
                                                    widget!.stories,
                                                    r'''$.image_url''',
                                                  ).toString(),
                                                  fit: BoxFit.contain,
                                                  errorWidget: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                allowRotation: false,
                                                tag: getJsonField(
                                                  widget!.stories,
                                                  r'''$.image_url''',
                                                ).toString(),
                                                useHeroAnimation: true,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Hero(
                                          tag: getJsonField(
                                            widget!.stories,
                                            r'''$.image_url''',
                                          ).toString(),
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: getJsonField(
                                                widget!.stories,
                                                r'''$.image_url''',
                                              ).toString(),
                                              width: double.infinity,
                                              height: 220.0,
                                              fit: BoxFit.cover,
                                              errorWidget: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: double.infinity,
                                                height: 220.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            widget!.stories,
                                            r'''$.title''',
                                          )?.toString(),
                                          'bridge',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.raleway(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText2,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          getJsonField(
                                            widget!.stories,
                                            r'''$.fullNarrative''',
                                          )?.toString(),
                                          'In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...  In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...  In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText2,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 20.0)),
                                ),
                              ),
                            ),
                          ),
                        ].addToEnd(SizedBox(height: 100.0)),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: Container(
                        height: 260.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          StoryMapWidget.routeName,
                                          queryParameters: {
                                            'story': serializeParam(
                                              widget!.stories,
                                              ParamType.JSON,
                                            ),
                                            'from': serializeParam(
                                              widget!.from,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Icon(
                                        FFIcons.kgpsFix,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.playing) {
                                          await actions.speak(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget!.stories,
                                                r'''$.fullNarrative''',
                                              )?.toString(),
                                              'In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...  In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...  In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...',
                                            ),
                                            true,
                                          );
                                          _model.playing = false;
                                          safeSetState(() {});
                                        } else {
                                          await actions.speak(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                widget!.stories,
                                                r'''$.fullNarrative''',
                                              )?.toString(),
                                              'In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...  In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...  In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...',
                                            ),
                                            false,
                                          );
                                          _model.playing = true;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        width: 163.14,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .defaultWhite,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (_model.playing)
                                              Icon(
                                                Icons.pause_sharp,
                                                color: Color(0xFF2D2D2D),
                                                size: 20.0,
                                              ),
                                            if (!_model.playing)
                                              Icon(
                                                Icons.volume_up,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText2,
                                                size: 20.0,
                                              ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'geuuhlds' /* Read out Loud */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.raleway(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText2,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (!_model.issave)
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.issave != true) {
                                            _model.uuid =
                                                await actions.uuidgen();
                                            _model.save =
                                                await SavedPlacesTable()
                                                    .insert({
                                              'stories': widget!.stories,
                                              'user_id': currentUserUid,
                                              'name': getJsonField(
                                                widget!.stories,
                                                r'''$.title''',
                                              ).toString(),
                                              'fullNarrative': getJsonField(
                                                widget!.stories,
                                                r'''$.fullNarrative''',
                                              ).toString(),
                                              'id': _model.uuid,
                                            });
                                            _model.issave = true;
                                            safeSetState(() {});

                                            context.goNamed(
                                              SavestoryWidget.routeName,
                                              queryParameters: {
                                                'stories': serializeParam(
                                                  widget!.stories,
                                                  ParamType.JSON,
                                                ),
                                                'from': serializeParam(
                                                  widget!.from,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 142.68,
                                          height: 48.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3A220),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.bookmark_border,
                                                color: Colors.white,
                                                size: 20.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  _model.issave == true
                                                      ? 'Saved'
                                                      : 'Save for Later',
                                                  'Save for Later',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.raleway(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  if (_model.hasquiz == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'you have completed the quiz',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .notificationsWarnings,
                                      ),
                                    );
                                  } else {
                                    context.goNamed(
                                      QuizQuestionInterfaceWidget.routeName,
                                      queryParameters: {
                                        'history': serializeParam(
                                          widget!.stories,
                                          ParamType.JSON,
                                        ),
                                        'from': serializeParam(
                                          widget!.from,
                                          ParamType.String,
                                        ),
                                        'id': serializeParam(
                                          widget!.id,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    await actions.speak(
                                      'newffff',
                                      true,
                                    );
                                    _model.playing = false;
                                    safeSetState(() {});
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'ikpq158u' /* Take Quiz (+500 xp) */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 56.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF8ACE42),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration,
                                    width: 40.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 20.0))
                                .addToEnd(SizedBox(height: 40.0)),
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
      ),
    );
  }
}
