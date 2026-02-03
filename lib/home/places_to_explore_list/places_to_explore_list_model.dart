import '/component/shimmer/shimmer_widget.dart';
import '/components/storycomponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'places_to_explore_list_widget.dart' show PlacesToExploreListWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlacesToExploreListModel
    extends FlutterFlowModel<PlacesToExploreListWidget> {
  ///  Local state fields for this page.

  bool isfeching = false;

  ///  State fields for stateful widgets in this page.

  // Models for storycomponent dynamic component.
  late FlutterFlowDynamicModels<StorycomponentModel> storycomponentModels;
  // Model for shimmer component.
  late ShimmerModel shimmerModel1;
  // Model for shimmer component.
  late ShimmerModel shimmerModel2;
  // Model for shimmer component.
  late ShimmerModel shimmerModel3;

  @override
  void initState(BuildContext context) {
    storycomponentModels =
        FlutterFlowDynamicModels(() => StorycomponentModel());
    shimmerModel1 = createModel(context, () => ShimmerModel());
    shimmerModel2 = createModel(context, () => ShimmerModel());
    shimmerModel3 = createModel(context, () => ShimmerModel());
  }

  @override
  void dispose() {
    storycomponentModels.dispose();
    shimmerModel1.dispose();
    shimmerModel2.dispose();
    shimmerModel3.dispose();
  }
}
