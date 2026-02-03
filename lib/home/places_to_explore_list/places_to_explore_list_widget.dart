import '/component/shimmer/shimmer_widget.dart';
import '/components/storycomponent_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'places_to_explore_list_model.dart';
export 'places_to_explore_list_model.dart';

class PlacesToExploreListWidget extends StatefulWidget {
  const PlacesToExploreListWidget({super.key});

  static String routeName = 'PlacesToExploreList';
  static String routePath = '/placesToExploreList';

  @override
  State<PlacesToExploreListWidget> createState() =>
      _PlacesToExploreListWidgetState();
}

class _PlacesToExploreListWidgetState extends State<PlacesToExploreListWidget> {
  late PlacesToExploreListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlacesToExploreListModel());

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
                        Flexible(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Frame_1261155275_(2).png',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.fill,
                                alignment: Alignment(0.0, -1.0),
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Frame_1261155274.png',
                            width: 237.0,
                            height: 32.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Frame_1261155277.png',
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
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
          child: Builder(
            builder: (context) {
              if (FFAppState().Newstories.length >= 1) {
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final history = FFAppState().Newstories.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: history.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                        itemBuilder: (context, historyIndex) {
                          final historyItem = history[historyIndex];
                          return wrapWithModel(
                            model: _model.storycomponentModels.getModel(
                              historyIndex.toString(),
                              historyIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: StorycomponentWidget(
                              key: Key(
                                'Key65z_${historyIndex.toString()}',
                              ),
                              stories: historyItem,
                              from: 'place',
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.shimmerModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: ShimmerWidget(),
                      ),
                      wrapWithModel(
                        model: _model.shimmerModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ShimmerWidget(),
                      ),
                      wrapWithModel(
                        model: _model.shimmerModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: ShimmerWidget(),
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
