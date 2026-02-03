import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interest_selection_interface_model.dart';
export 'interest_selection_interface_model.dart';

class InterestSelectionInterfaceWidget extends StatefulWidget {
  const InterestSelectionInterfaceWidget({
    super.key,
    this.email,
    this.password,
    this.password2,
    this.username,
    required this.social,
    this.socialtype,
  });

  final String? email;
  final String? password;
  final String? password2;
  final String? username;
  final bool? social;
  final Socialtype? socialtype;

  static String routeName = 'InterestSelectionInterface';
  static String routePath = '/interestSelectionInterface';

  @override
  State<InterestSelectionInterfaceWidget> createState() =>
      _InterestSelectionInterfaceWidgetState();
}

class _InterestSelectionInterfaceWidgetState
    extends State<InterestSelectionInterfaceWidget> {
  late InterestSelectionInterfaceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestSelectionInterfaceModel());

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
        body: Container(
          decoration: BoxDecoration(),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText2,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '4rlusiep' /* Select your area of interest */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText2,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  Expanded(
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 4.0,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst.contains('History') ==
                                true) {
                              _model.removeFromSelectedintrst('History');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('History');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    _model.selectedintrst.contains('History') ==
                                            true
                                        ? FlutterFlowTheme.of(context)
                                            .mainBrandColorSuccessExploration
                                        : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('History') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '5kro5r2g' /* History */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst.contains('Folklore') ==
                                true) {
                              _model.removeFromSelectedintrst('Folklore');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Folklore');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Folklore') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Folklore') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ra2oszul' /* Folklore */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst.contains('Festivals') ==
                                true) {
                              _model.removeFromSelectedintrst('Festivals');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Festivals');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Festivals') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Festivals') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '9ghw3tym' /* Festivals */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst.contains('Adventure') ==
                                true) {
                              _model.removeFromSelectedintrst('Adventure');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Adventure');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Adventure') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Adventure') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'zd4qyvx7' /* Adventure */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst
                                    .contains('Art & Culture') ==
                                true) {
                              _model.removeFromSelectedintrst('Art & Culture');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Art & Culture');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Art & Culture') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Art & Culture') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '4subwvpg' /* Art & Culture */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst
                                    .contains('Architecture') ==
                                true) {
                              _model.removeFromSelectedintrst('Architecture');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Architecture');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Architecture') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Architecture') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'k6nmgm8k' /* Architecture */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst
                                    .contains('Food & Cuisine') ==
                                true) {
                              _model.removeFromSelectedintrst('Food & Cuisine');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Food & Cuisine');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Food & Cuisine') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Food & Cuisine') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '593kghbw' /* Food & Cuisine */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst.contains('Nature') ==
                                true) {
                              _model.removeFromSelectedintrst('Nature');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Nature');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color:
                                    _model.selectedintrst.contains('Nature') ==
                                            true
                                        ? FlutterFlowTheme.of(context)
                                            .mainBrandColorSuccessExploration
                                        : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Nature') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '8viux8j7' /* Nature */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst
                                    .contains('Local Traditions') ==
                                true) {
                              _model
                                  .removeFromSelectedintrst('Local Traditions');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Local Traditions');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Local Traditions') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst.contains(
                                                  'Local Traditions') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'hs9lfm5s' /* Local Traditions */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst.contains('Travel Tips') ==
                                true) {
                              _model.removeFromSelectedintrst('Travel Tips');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Travel Tips');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Travel Tips') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Travel Tips') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ze08042a' /* Travel Tips */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst.contains('Wildlife') ==
                                true) {
                              _model.removeFromSelectedintrst('Wildlife');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Wildlife');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Wildlife') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Wildlife') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'e9sdp3d2' /* Wildlife */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedintrst.contains('Real Estate') ==
                                true) {
                              _model.removeFromSelectedintrst('Real Estate');
                              safeSetState(() {});
                            } else {
                              _model.addToSelectedintrst('Real Estate');
                              safeSetState(() {});
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0x2764748B),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: _model.selectedintrst
                                            .contains('Real Estate') ==
                                        true
                                    ? FlutterFlowTheme.of(context)
                                        .mainBrandColorSuccessExploration
                                    : Color(0x00000000),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.selectedintrst
                                                  .contains('Real Estate') ==
                                              false) {
                                            return Icon(
                                              Icons.check_box_outline_blank,
                                              color: Color(0x2764748B),
                                              size: 16.0,
                                            );
                                          } else {
                                            return Icon(
                                              Icons.check_box_rounded,
                                              color: FlutterFlowTheme.of(
                                                      context)
                                                  .mainBrandColorSuccessExploration,
                                              size: 16.0,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'dpq5b2mk' /* Real Estate */,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          LocationPermissionRequestScreenWidget.routeName,
                          queryParameters: {
                            'username': serializeParam(
                              widget!.username,
                              ParamType.String,
                            ),
                            'password': serializeParam(
                              widget!.password,
                              ParamType.String,
                            ),
                            'password2': serializeParam(
                              widget!.password2,
                              ParamType.String,
                            ),
                            'email': serializeParam(
                              widget!.email,
                              ParamType.String,
                            ),
                            'social': serializeParam(
                              widget!.social,
                              ParamType.bool,
                            ),
                            'intgrest': serializeParam(
                              _model.selectedintrst,
                              ParamType.String,
                              isList: true,
                            ),
                            'socialtype': serializeParam(
                              widget!.socialtype,
                              ParamType.Enum,
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
                      text: FFLocalizations.of(context).getText(
                        'rgaqbswd' /* Continue */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 56.0,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF8ACE42),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
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
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 24.0))
                    .addToStart(SizedBox(height: 24.0))
                    .addToEnd(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
