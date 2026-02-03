import '/components/mapcard_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'story_mapstories_widget.dart' show StoryMapstoriesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoryMapstoriesModel extends FlutterFlowModel<StoryMapstoriesWidget> {
  ///  Local state fields for this page.

  bool serched = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for mapcard component.
  late MapcardModel mapcardModel;

  @override
  void initState(BuildContext context) {
    mapcardModel = createModel(context, () => MapcardModel());
  }

  @override
  void dispose() {
    mapcardModel.dispose();
  }
}
