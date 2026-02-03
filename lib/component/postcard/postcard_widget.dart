import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/likecomp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'postcard_model.dart';
export 'postcard_model.dart';

class PostcardWidget extends StatefulWidget {
  const PostcardWidget({
    super.key,
    required this.title,
    required this.useimage,
    required this.description,
    required this.time,
    required this.image,
    required this.likecount,
    required this.commentcount,
    required this.sharecount,
    required this.liks,
    required this.id,
    this.posts,
  });

  final String? title;
  final String? useimage;
  final String? description;
  final String? time;
  final String? image;
  final int? likecount;
  final int? commentcount;
  final int? sharecount;
  final List<String>? liks;
  final String? id;
  final PostsWithMetaImagesRow? posts;

  @override
  State<PostcardWidget> createState() => _PostcardWidgetState();
}

class _PostcardWidgetState extends State<PostcardWidget> {
  late PostcardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostcardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 56.0,
                height: 56.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      valueOrDefault<String>(
                        widget!.useimage,
                        'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzQ5NzA4NXww&ixlib=rb-4.1.0&q=80&w=1080',
                      ),
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            valueOrDefault<String>(
                              widget!.title,
                              'Heritage Walking Tour',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.raleway(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText2,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.time,
                            '2 hr',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                font: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText2,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(width: 30.0)),
                    ),
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget!.description,
                          'Lorem ipsum dolor sit amet, consectetur adipiscin elit. Sed do eiusmod tempor Lorem ipsum dolor sit...',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.raleway(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color:
                                  FlutterFlowTheme.of(context).secondaryText2,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          Container(
            width: double.infinity,
            height: 172.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                valueOrDefault<String>(
                  widget!.image,
                  'https://images.unsplash.com/photo-1444080748397-f442aa95c3e5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxuaWdodCUyMHNreXxlbnwwfHx8fDE3NjM0ODE1OTR8MA&ixlib=rb-4.1.0&q=80&w=1080',
                ),
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).dMContainer,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: FutureBuilder<List<LikesRow>>(
                  future: LikesTable().querySingleRow(
                    queryFn: (q) => q
                        .eqOrNull(
                          'post_id',
                          widget!.id,
                        )
                        .eqOrNull(
                          'user_id',
                          currentUserUid,
                        ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return LikecompWidget();
                    }
                    List<LikesRow> rowLikesRowList = snapshot.data!;

                    final rowLikesRow = rowLikesRowList.isNotEmpty
                        ? rowLikesRowList.first
                        : null;

                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Builder(
                          builder: (context) {
                            if (widget!.liks?.contains(currentUserUid) ??
                                false) {
                              return Icon(
                                FFIcons.kheart,
                                color: FlutterFlowTheme.of(context)
                                    .notificationsWarnings,
                                size: 25.0,
                              );
                            } else {
                              return Icon(
                                FFIcons.kheart,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText2,
                                size: 25.0,
                              );
                            }
                          },
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.likecount?.toString(),
                            '25',
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText2,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(width: 7.0)),
                    );
                  },
                ),
              ),
              Container(
                width: 80.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).dMContainer,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      color: FlutterFlowTheme.of(context).secondaryText2,
                      size: 25.0,
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget!.commentcount?.toString(),
                        '25',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: Color(0xFF64748B),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 7.0)),
                ),
              ),
              Container(
                width: 80.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).dMContainer,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.share,
                      color: FlutterFlowTheme.of(context).secondaryText2,
                      size: 25.0,
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget!.sharecount?.toString(),
                        '25',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: Color(0xFF64748B),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(width: 7.0)),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
        ].divide(SizedBox(height: 12.0)),
      ),
    );
  }
}
