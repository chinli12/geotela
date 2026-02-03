import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/component/nav/nav_widget.dart';
import '/component/shimmer/shimmer_widget.dart';
import '/components/emptyitem_widget.dart';
import '/components/storycomponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'stories_widget.dart' show StoriesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoriesModel extends FlutterFlowModel<StoriesWidget> {
  ///  Local state fields for this page.

  List<HistoryStoriesStruct> stories = [];
  void addToStories(HistoryStoriesStruct item) => stories.add(item);
  void removeFromStories(HistoryStoriesStruct item) => stories.remove(item);
  void removeAtIndexFromStories(int index) => stories.removeAt(index);
  void insertAtIndexInStories(int index, HistoryStoriesStruct item) =>
      stories.insert(index, item);
  void updateStoriesAtIndex(
          int index, Function(HistoryStoriesStruct) updateFn) =>
      stories[index] = updateFn(stories[index]);

  int index = 0;

  ///  State fields for stateful widgets in this page.

  Stream<List<SavedPlacesRow>>? listViewSupabaseStream;
  // Models for storycomponent dynamic component.
  late FlutterFlowDynamicModels<StorycomponentModel> storycomponentModels;
  // Model for Nav component.
  late NavModel navModel;

  @override
  void initState(BuildContext context) {
    storycomponentModels =
        FlutterFlowDynamicModels(() => StorycomponentModel());
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    storycomponentModels.dispose();
    navModel.dispose();
  }
}
