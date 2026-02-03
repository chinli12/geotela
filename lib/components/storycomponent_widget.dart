import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'storycomponent_model.dart';
export 'storycomponent_model.dart';

class StorycomponentWidget extends StatefulWidget {
  const StorycomponentWidget({
    super.key,
    this.stories,
    required this.from,
    this.id,
  });

  final dynamic stories;
  final String? from;
  final String? id;

  @override
  State<StorycomponentWidget> createState() => _StorycomponentWidgetState();
}

class _StorycomponentWidgetState extends State<StorycomponentWidget> {
  late StorycomponentModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StorycomponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.storissave = await SavedPlacesTable().queryRows(
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
            )
            .eqOrNull(
              'fullNarrative',
              getJsonField(
                widget!.stories,
                r'''$.fullNarrative''',
              ).toString(),
            ),
      );
      if (_model.storissave != null && (_model.storissave)!.isNotEmpty) {
        _model.isave = true;
        _model.updatePage(() {});
      } else {
        _model.isave = false;
        _model.updatePage(() {});
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).mainBrandColorSuccessExploration,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: valueOrDefault<String>(
                      getJsonField(
                        widget!.stories,
                        r'''$.image_url''',
                      )?.toString(),
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/testingmy-qyowy1/assets/v7rqfj51qkov/504708-200.png',
                    ),
                    width: 48.0,
                    height: 48.0,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.png',
                      width: 48.0,
                      height: 48.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            .titleMedium
                            .override(
                              font: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText2,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kmapPinSimpleArea,
                                color: FlutterFlowTheme.of(context).secondrybtn,
                                size: 12.0,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions.calculatedistance(
                                      currentUserLocationValue!,
                                      functions.getlatlong(
                                          valueOrDefault<double>(
                                            getJsonField(
                                              widget!.stories,
                                              r'''$.location.lat''',
                                            ),
                                            0.098,
                                          ),
                                          valueOrDefault<double>(
                                            getJsonField(
                                              widget!.stories,
                                              r'''$.location.lon''',
                                            ),
                                            0.0989,
                                          ))!),
                                  '120m away',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText2,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Container(
                            width: 4.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kclock,
                                color: FlutterFlowTheme.of(context).secondrybtn,
                                size: 12.0,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  '${valueOrDefault<String>(
                                    getJsonField(
                                      widget!.stories,
                                      r'''$.readTime''',
                                    )?.toString(),
                                    '0',
                                  )}  min read',
                                  '5 min',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText2,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Container(
                            width: 4.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.klightning,
                                color: FlutterFlowTheme.of(context).secondrybtn,
                                size: 12.0,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  getJsonField(
                                    widget!.stories,
                                    r'''$.points''',
                                  )?.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondrybtn,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            Text(
              valueOrDefault<String>(
                getJsonField(
                  widget!.stories,
                  r'''$.description''',
                )?.toString(),
                'Disscover the royal heritage and political intruige of the ancient Bridge, Disscover the royal heritage and political intruige of the ancient Bridge, the royal heritage and political intruige of the ancient Bridge, Disscover the royal heritage and political intruige of the ancient Bridge',
              ),
              maxLines: 3,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.raleway(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText2,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    lineHeight: 1.2,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (widget!.from == 'save') {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
                          StoryDetailViewstoriesWidget.routeName,
                          queryParameters: {
                            'stories': serializeParam(
                              widget!.stories,
                              ParamType.JSON,
                            ),
                            'from': serializeParam(
                              'save',
                              ParamType.String,
                            ),
                            'id': serializeParam(
                              widget!.id,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed(
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
                            'id': serializeParam(
                              widget!.id,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      'dxdcxels' /* Read */,
                    ),
                    options: FFButtonOptions(
                      width: 100.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF8ACE42),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                Expanded(
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
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
                    text: FFLocalizations.of(context).getText(
                      'ufvmtxjn' /* Show on Map */,
                    ),
                    options: FFButtonOptions(
                      width: 120.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.white,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: Color(0xFFF3A220),
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Color(0xFFF3A220),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.isave != true) {
                      _model.uuid = await actions.uuidgen();
                      _model.save = await SavedPlacesTable().insert({
                        'user_id': currentUserUid,
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
                      _model.isave = true;
                      _model.updatePage(() {});
                    }

                    safeSetState(() {});
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: _model.isave == true
                          ? Color(0x98FF5963)
                          : FlutterFlowTheme.of(context).alternate,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.bookmark_border,
                        color: _model.isave == true
                            ? FlutterFlowTheme.of(context).icon
                            : FlutterFlowTheme.of(context).icon,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
