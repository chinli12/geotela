import '/backend/api_requests/api_calls.dart';
import '/components/storycomponent_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  static String routeName = 'Search';
  static String routePath = '/search';

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with TickerProviderStateMixin {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().searchstories.isNotEmpty) {
        _model.dataready = true;
        safeSetState(() {});
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
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
                            context.pushNamed(HomescreenWidget.routeName);
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (_model.isfeching)
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ng399wya' /* fetching stories for the locat... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.raleway(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .xPRewardsAchievements,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                    ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: Builder(builder: (context) {
                          final _googleMapMarker =
                              _model.placePickerValue1.latLng;
                          return FlutterFlowGoogleMap(
                            controller: _model.googleMapsController,
                            onCameraIdle: (latLng) => safeSetState(
                                () => _model.googleMapsCenter = latLng),
                            initialLocation: _model.googleMapsCenter ??=
                                currentUserLocationValue!,
                            markers: [
                              if (_googleMapMarker != null)
                                FlutterFlowMarker(
                                  _googleMapMarker.serialize(),
                                  _googleMapMarker,
                                  () async {
                                    _model.isfeching = !_model.isfeching;
                                    safeSetState(() {});
                                    _model.apiResult3rf =
                                        await GeministoriesCall.call(
                                      locationName:
                                          '${_model.placePickerValue1.name}, ${_model.placePickerValue1.city}, ${_model.placePickerValue1.state}, ${_model.placePickerValue1.country}',
                                      geminiApiKey: FFAppState().Apikey,
                                      number: 6,
                                    );

                                    if ((_model.apiResult3rf?.succeeded ??
                                        true)) {
                                      FFAppState().searchstories = functions
                                          .retunjson(GeministoriesCall.response(
                                            (_model.apiResult3rf?.jsonBody ??
                                                ''),
                                          ))!
                                          .toList()
                                          .cast<dynamic>();
                                      safeSetState(() {});
                                      _model.isfeching = !_model.isfeching;
                                      _model.dataready = !_model.dataready;
                                      safeSetState(() {});
                                    } else {
                                      _model.isfeching = !_model.isfeching;
                                      safeSetState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'failed to fetch stories',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .notificationsWarnings,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                            ],
                            markerColor: GoogleMarkerColor.violet,
                            markerImage: MarkerImage(
                              imagePath: 'assets/images/currentn.png',
                              isAssetImage: true,
                              size: 80.0 ?? 20,
                            ),
                            mapType: MapType.normal,
                            style: GoogleMapStyle.standard,
                            initialZoom: 14.0,
                            allowInteraction: true,
                            allowZoom: true,
                            showZoomControls: true,
                            showLocation: true,
                            showCompass: false,
                            showMapToolbar: false,
                            showTraffic: false,
                            centerMapOnMarkerTap: true,
                            mapTakesGesturePreference: true,
                          );
                        }),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'du65x8rd' /* Search */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.raleway(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF2D2D2D),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Container(
                                    height: 100.0,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: FlutterFlowPlacePicker(
                                            iOSGoogleMapsApiKey:
                                                'AIzaSyDqPR5yDMelBQS5hxJTOy5mxMAAzaR9aBo',
                                            androidGoogleMapsApiKey:
                                                'AIzaSyDqPR5yDMelBQS5hxJTOy5mxMAAzaR9aBo',
                                            webGoogleMapsApiKey:
                                                'AIzaSyDqPR5yDMelBQS5hxJTOy5mxMAAzaR9aBo',
                                            onSelect: (place) async {
                                              safeSetState(() => _model
                                                  .placePickerValue1 = place);
                                              (await _model.googleMapsController
                                                      .future)
                                                  .animateCamera(
                                                      CameraUpdate.newLatLng(
                                                          place.latLng
                                                              .toGoogleMaps()));
                                            },
                                            defaultText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '5qrylom8' /* Search location */,
                                            ),
                                            icon: Icon(
                                              Icons.place,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 16.0,
                                            ),
                                            buttonOptions: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40.0,
                                              color: Color(0x1464748B),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.raleway(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0.0),
                                          child: Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x2C8ACE42),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.swap_vert,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLightPrimary,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        FlutterFlowPlacePicker(
                                          iOSGoogleMapsApiKey:
                                              'AIzaSyDqPR5yDMelBQS5hxJTOy5mxMAAzaR9aBo',
                                          androidGoogleMapsApiKey:
                                              'AIzaSyDqPR5yDMelBQS5hxJTOy5mxMAAzaR9aBo',
                                          webGoogleMapsApiKey:
                                              'AIzaSyDqPR5yDMelBQS5hxJTOy5mxMAAzaR9aBo',
                                          onSelect: (place) async {
                                            safeSetState(() => _model
                                                .placePickerValue2 = place);
                                          },
                                          defaultText:
                                              FFLocalizations.of(context)
                                                  .getText(
                                            'fxxwskvt' /* your location */,
                                          ),
                                          icon: Icon(
                                            Icons.place,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 16.0,
                                          ),
                                          buttonOptions: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            color: Color(0x1464748B),
                                            textAlign: TextAlign.center,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.raleway(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (_model.dataready)
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 200.0, 0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final item =
                                    FFAppState().searchstories.toList();

                                return SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(item.length, (itemIndex) {
                                      final itemItem = item[itemIndex];
                                      return wrapWithModel(
                                        model: _model.storycomponentModels
                                            .getModel(
                                          itemIndex.toString(),
                                          itemIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: StorycomponentWidget(
                                          key: Key(
                                            'Keysoj_${itemIndex.toString()}',
                                          ),
                                          from: 'search',
                                          stories: itemItem,
                                          id: getJsonField(
                                            itemItem,
                                            r'''$.id''',
                                          ).toString(),
                                        ),
                                      );
                                    })
                                            .divide(SizedBox(height: 24.0))
                                            .addToStart(SizedBox(height: 32.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
