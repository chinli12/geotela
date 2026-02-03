import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_question_interface_model.dart';
export 'quiz_question_interface_model.dart';

class QuizQuestionInterfaceWidget extends StatefulWidget {
  const QuizQuestionInterfaceWidget({
    super.key,
    required this.history,
    required this.from,
    this.id,
  });

  final dynamic history;
  final String? from;
  final String? id;

  static String routeName = 'QuizQuestionInterface';
  static String routePath = '/quizQuestionInterface';

  @override
  State<QuizQuestionInterfaceWidget> createState() =>
      _QuizQuestionInterfaceWidgetState();
}

class _QuizQuestionInterfaceWidgetState
    extends State<QuizQuestionInterfaceWidget> {
  late QuizQuestionInterfaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizQuestionInterfaceModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult7zg = await GeminiGetQuestionsCall.call(
        geminiApiKey: dotenv.env['GOOGLE_GEMINI_API_KEY'] ??
            'AIzaSyBvU8wYlpe9NoyxMlbevHN_bNbR_eNebUY',
        storyText: getJsonField(
          widget!.history,
          r'''$.fullNarrative''',
        ).toString(),
      );

      if ((_model.apiResult7zg?.succeeded ?? true)) {
        _model.parsed = await actions.parseQuestionsJson(
          GeminiGetQuestionsCall.quize(
            (_model.apiResult7zg?.jsonBody ?? ''),
          )!,
        );
        _model.quizes = _model.parsed!.toList().cast<QuestionStruct>();
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  if (_model.pageViewCurrentIndex > 0) {
                                    await _model.pageViewController
                                        ?.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
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
                                  ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '9bc6t6mb' /* Question  */,
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
                                      text: valueOrDefault<String>(
                                        _model.pageViewCurrentIndex.toString(),
                                        '0',
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'wy55pmru' /* / */,
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        _model.quizes.length.toString(),
                                        '5',
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 14.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  StoryDetailViewWidget.routeName,
                                  queryParameters: {
                                    'stories': serializeParam(
                                      widget!.history,
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
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/Frame_1261155277_(1).png',
                                    ).image,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Builder(
              builder: (context) {
                final quize = getJsonField(
                  widget!.history,
                  r'''$.quiz''',
                ).toList();

                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage:
                                      max(0, min(0, quize.length - 1))),
                          scrollDirection: Axis.horizontal,
                          itemCount: quize.length,
                          itemBuilder: (context, quizeIndex) {
                            final quizeItem = quize[quizeIndex];
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 240.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF506C64),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      getJsonField(
                                                        quizeItem,
                                                        r'''$.question''',
                                                      )?.toString(),
                                                      'The Ghost of BridgeThe Ghost of Liberty Bridge The Ghost of Liberty Bridge',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .raleway(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                          lineHeight: 1.15,
                                                        ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (_model.playstate) {
                                                          await actions.speak(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                quizeItem,
                                                                r'''$.question''',
                                                              )?.toString(),
                                                              'The Ghost of BridgeThe Ghost of Liberty Bridge The Ghost of Liberty Bridge',
                                                            ),
                                                            true,
                                                          );
                                                        } else {
                                                          await actions.speak(
                                                            valueOrDefault<
                                                                String>(
                                                              getJsonField(
                                                                quizeItem,
                                                                r'''$.question''',
                                                              )?.toString(),
                                                              'The Ghost of BridgeThe Ghost of Liberty Bridge The Ghost of Liberty Bridge',
                                                            ),
                                                            false,
                                                          );
                                                        }

                                                        _model.playstate =
                                                            !_model.playstate;
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (_model
                                                                    .playstate ==
                                                                false)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .volume_up,
                                                                  color: Color(
                                                                      0xFF506C64),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            if (_model
                                                                    .playstate !=
                                                                false)
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Icon(
                                                                  Icons.pause,
                                                                  color: Color(
                                                                      0xFF506C64),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final option = getJsonField(
                                                quizeItem,
                                                r'''$.options''',
                                              ).toList();

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children:
                                                    List.generate(option.length,
                                                        (optionIndex) {
                                                  final optionItem =
                                                      option[optionIndex];
                                                  return Expanded(
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (_model.answers.contains(
                                                                optionItem
                                                                    .toString()) ==
                                                            true) {
                                                          _model.removeFromAnswers(
                                                              optionItem
                                                                  .toString());
                                                          _model.removeFromAnswrindex(
                                                              _model
                                                                  .pageViewCurrentIndex);
                                                          safeSetState(() {});
                                                          if (functions
                                                              .checkAnswer(
                                                                  optionIndex,
                                                                  getJsonField(
                                                                    quizeItem,
                                                                    r'''$.correctAnswer''',
                                                                  ))) {
                                                            _model.score =
                                                                _model.score +
                                                                    -100;
                                                            _model.correct =
                                                                _model.correct +
                                                                    -1;
                                                            safeSetState(() {});
                                                          }
                                                        } else {
                                                          if (_model.answrindex
                                                                  .contains(_model
                                                                      .pageViewCurrentIndex) !=
                                                              true) {
                                                            _model.addToAnswers(
                                                                optionItem
                                                                    .toString());
                                                            _model.addToAnswrindex(
                                                                _model
                                                                    .pageViewCurrentIndex);
                                                            safeSetState(() {});
                                                          }
                                                          if (functions
                                                              .checkAnswer(
                                                                  optionIndex,
                                                                  getJsonField(
                                                                    quizeItem,
                                                                    r'''$.correctAnswer''',
                                                                  ))) {
                                                            _model.score =
                                                                _model.score +
                                                                    100;
                                                            _model.correct =
                                                                _model.correct +
                                                                    1;
                                                            safeSetState(() {});
                                                          }
                                                        }
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 56.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: _model.answers
                                                                      .contains(
                                                                          optionItem
                                                                              .toString()) ==
                                                                  true
                                                              ? Color(
                                                                  0x19F3A220)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .form,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: _model
                                                                        .answers
                                                                        .contains(optionItem
                                                                            .toString()) ==
                                                                    true
                                                                ? Color(
                                                                    0xFFF3A220)
                                                                : Color(
                                                                    0x00000000),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                optionItem
                                                                    .toString(),
                                                                'The answer is 1',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                        0xFF374151),
                                                                    fontSize:
                                                                        12.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).divide(
                                                        SizedBox(height: 16.0)),
                                              );
                                            },
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.pageViewCurrentIndex ==
                                                  4) {
                                                context.goNamed(
                                                  QuizzpointWidget.routeName,
                                                  queryParameters: {
                                                    'score': serializeParam(
                                                      _model.score,
                                                      ParamType.int,
                                                    ),
                                                    'story': serializeParam(
                                                      widget!.history,
                                                      ParamType.JSON,
                                                    ),
                                                    'correct': serializeParam(
                                                      _model.correct,
                                                      ParamType.int,
                                                    ),
                                                    'isave': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'id': serializeParam(
                                                      widget!.id,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                await _model.pageViewController
                                                    ?.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                                safeSetState(() {});
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'jdev25g7' /* Next */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 56.0,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF8ACE42),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.raleway(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 5.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 16.0))
                                            .addToStart(SizedBox(height: 16.0))
                                            .addToEnd(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage:
                                        max(0, min(0, quize.length - 1))),
                            count: quize.length,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              safeSetState(() {});
                            },
                            effect: smooth_page_indicator.SlideEffect(
                              spacing: 8.0,
                              radius: 8.0,
                              dotWidth: 60.0,
                              dotHeight: 4.0,
                              dotColor: Color(0xFFD1D5DB),
                              activeDotColor: FlutterFlowTheme.of(context)
                                  .mainBrandColorSuccessExploration,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
