import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'story_detail_view_focuse_model.dart';
export 'story_detail_view_focuse_model.dart';

class StoryDetailViewFocuseWidget extends StatefulWidget {
  const StoryDetailViewFocuseWidget({
    super.key,
    required this.stories,
    required this.from,
    this.id,
  });

  final dynamic stories;
  final String? from;
  final String? id;

  static String routeName = 'storyDetailViewFocuse';
  static String routePath = '/storyDetailViewFocuse';

  @override
  State<StoryDetailViewFocuseWidget> createState() =>
      _StoryDetailViewFocuseWidgetState();
}

class _StoryDetailViewFocuseWidgetState
    extends State<StoryDetailViewFocuseWidget> {
  late StoryDetailViewFocuseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryDetailViewFocuseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.storis = await SavedPlacesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              currentUserUid,
            )
            .eqOrNull(
              'story_id',
              widget!.id,
            )
            .eqOrNull(
              'name',
              getJsonField(
                widget!.stories,
                r'''$.title''',
              ).toString(),
            )
            .eqOrNull(
              'fullNarrative',
              getJsonField(
                widget!.stories,
                r'''$.fullNarrative''',
              ).toString(),
            ),
      );
      if (_model.storis != null && (_model.storis)!.isNotEmpty) {
        _model.issaved = true;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Focus_mode_(1).png',
              ).image,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
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

                        context.goNamed(
                          StoryDetailViewWidget.routeName,
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
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
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
                              'assets/images/Frame_1261155274_(2).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 160.0),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      getJsonField(
                                        widget!.stories,
                                        r'''$.title''',
                                      )?.toString(),
                                      'title',
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
                                          color: FlutterFlowTheme.of(context)
                                              .white,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
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
                                            color: FlutterFlowTheme.of(context)
                                                .white,
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
                                  child: Container(
                                    width: 56.0,
                                    height: 56.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/Frame_1261155039_(2).png',
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (false)
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
                                            getJsonField(
                                              widget!.stories,
                                              r'''$.fullNarrative''',
                                            ).toString(),
                                            true,
                                          );
                                          _model.playing = false;
                                          safeSetState(() {});
                                        } else {
                                          await actions.speak(
                                            getJsonField(
                                              widget!.stories,
                                              r'''$.fullNarrative''',
                                            ).toString(),
                                            false,
                                          );
                                          _model.playing = true;
                                          safeSetState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF8F8F9),
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
                                                Icons.pause,
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
                                                '08rbtzlx' /* Read out Loud */,
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
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.issaved != true) {
                                          _model.uuid = await actions.uuidgen();
                                          _model.save =
                                              await SavedPlacesTable().insert({
                                            'user_id': currentUserUid,
                                            'story_id': widget!.id,
                                            'stories': widget!.stories,
                                            'id': _model.uuid,
                                            'name': getJsonField(
                                              widget!.stories,
                                              r'''$.title''',
                                            ).toString(),
                                            'fullNarrative': getJsonField(
                                              widget!.stories,
                                              r'''$.fullNarrative''',
                                            ).toString(),
                                          });
                                          _model.issaved = true;
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
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF3A220),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
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
                                                  _model.issaved == true
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
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            if (false)
                              FFButtonWidget(
                                onPressed: () async {
                                  await actions.speak(
                                    'newffff',
                                    true,
                                  );
                                  _model.playing = false;
                                  safeSetState(() {});

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
                                    }.withoutNulls,
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  '6teh395f' /* Take Quiz (+500 xp) */,
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
                                    width: 2.0,
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
    );
  }
}
