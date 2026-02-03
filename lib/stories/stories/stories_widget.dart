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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stories_model.dart';
export 'stories_model.dart';

class StoriesWidget extends StatefulWidget {
  const StoriesWidget({super.key});

  static String routeName = 'Stories';
  static String routePath = '/stories';

  @override
  State<StoriesWidget> createState() => _StoriesWidgetState();
}

class _StoriesWidgetState extends State<StoriesWidget> {
  late StoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoriesModel());

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
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Frame_1261155274_(6).png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 30.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: StreamBuilder<List<SavedPlacesRow>>(
                stream: FFAppState().savedplacecatche(
                  uniqueQueryKey: '${currentUserUid}',
                  requestFn: () => _model.listViewSupabaseStream ??= SupaFlow
                      .client
                      .from("saved_places")
                      .stream(primaryKey: ['id'])
                      .eqOrNull(
                        'user_id',
                        currentUserUid,
                      )
                      .order('created_at')
                      .map((list) =>
                          list.map((item) => SavedPlacesRow(item)).toList()),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return ShimmerWidget();
                  }
                  List<SavedPlacesRow> listViewSavedPlacesRowList =
                      snapshot.data!;

                  if (listViewSavedPlacesRowList.isEmpty) {
                    return EmptyitemWidget(
                      itemname: 'Stories',
                      action: () async {
                        context.pushNamed(HomescreenWidget.routeName);
                      },
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      100.0,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewSavedPlacesRowList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 12.0),
                    itemBuilder: (context, listViewIndex) {
                      final listViewSavedPlacesRow =
                          listViewSavedPlacesRowList[listViewIndex];
                      return wrapWithModel(
                        model: _model.storycomponentModels.getModel(
                          listViewIndex.toString(),
                          listViewIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: StorycomponentWidget(
                          key: Key(
                            'Keybrr_${listViewIndex.toString()}',
                          ),
                          from: 'save',
                          stories: listViewSavedPlacesRow.stories,
                          id: listViewSavedPlacesRow.id,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navModel,
                updateCallback: () => safeSetState(() {}),
                child: NavWidget(
                  tab: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
