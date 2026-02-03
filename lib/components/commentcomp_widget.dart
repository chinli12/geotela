import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/commentshimmer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'commentcomp_model.dart';
export 'commentcomp_model.dart';

class CommentcompWidget extends StatefulWidget {
  const CommentcompWidget({
    super.key,
    required this.comment,
    this.like,
    required this.index,
  });

  final CommentsWithMetaRow? comment;
  final Future Function()? like;
  final int? index;

  @override
  State<CommentcompWidget> createState() => _CommentcompWidgetState();
}

class _CommentcompWidgetState extends State<CommentcompWidget> {
  late CommentcompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentcompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.like = await CommentLikesTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'comment_id',
              widget!.comment?.commentId,
            )
            .eqOrNull(
              'user_id',
              currentUserUid,
            ),
      );
      if (_model.like != null && (_model.like)!.isNotEmpty) {
        _model.liked = true;
        safeSetState(() {});
      } else {
        _model.liked = false;
        safeSetState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          ProfilesuserWidget.routeName,
                          queryParameters: {
                            'userid': serializeParam(
                              widget!.comment?.userId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              valueOrDefault<String>(
                                widget!.comment?.profileImage,
                                'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2NDUwNjU2OXww&ixlib=rb-4.1.0&q=80&w=1080',
                              ),
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.comment?.username,
                                      'username',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.raleway(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: Color(0xFF374151),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    functions.formatTimestamp(
                                        widget!.comment?.createdAt?.toString()),
                                    '2hr',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF64748B),
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
                          ),
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget!.comment?.content,
                                'null',
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
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              FFAppState().commentID =
                                  widget!.comment!.commentId!;
                              FFAppState().CommentToName =
                                  widget!.comment!.username!;
                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'h64r5n0u' /* Reply */,
                            ),
                            options: FFButtonOptions(
                              height: 20.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x000F172A),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText2,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 16.0,
                                height: 16.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .mainBrandColorSuccessExploration,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.thumb_up_alt,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 12.0,
                                ),
                              ),
                              Text(
                                formatNumber(
                                  widget!.comment!.commentLikeCount!,
                                  formatType: FormatType.compact,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText2,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 2.0)),
                          ),
                        ].divide(SizedBox(width: 20.0)),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleIcon(
                          onPressed: () async {
                            safeSetState(() => _model.liked = !_model.liked);
                            if (_model.liked) {
                              await CommentLikesTable().insert({
                                'comment_id': widget!.comment?.commentId,
                                'user_id': currentUserUid,
                                'is_active': true,
                              });
                              _model.liked = true;
                              safeSetState(() {});
                              await widget.like?.call();
                            } else {
                              await CommentLikesTable().delete(
                                matchingRows: (rows) => rows
                                    .eqOrNull(
                                      'comment_id',
                                      widget!.comment?.commentId,
                                    )
                                    .eqOrNull(
                                      'user_id',
                                      currentUserUid,
                                    ),
                              );
                              _model.liked = false;
                              safeSetState(() {});
                              await widget.like?.call();
                            }
                          },
                          value: _model.liked,
                          onIcon: Icon(
                            Icons.thumb_up_alt,
                            color: FlutterFlowTheme.of(context)
                                .notificationsWarnings,
                            size: 17.0,
                          ),
                          offIcon: Icon(
                            Icons.thumb_up_alt,
                            color: FlutterFlowTheme.of(context).primaryText2,
                            size: 17.0,
                          ),
                        ),
                      ].divide(SizedBox(width: 7.0)),
                    ),
                  ],
                ),
                if (widget!.comment!.replyCount! >= 1)
                  FFButtonWidget(
                    onPressed: () async {
                      _model.isviewing = !_model.isviewing;
                      safeSetState(() {});
                    },
                    text: 'view ${formatNumber(
                      widget!.comment?.replyCount,
                      formatType: FormatType.compact,
                    )} replies',
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 20.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x000F172A),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText2,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ],
            ),
          ),
          if (_model.isviewing == true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 15.0),
              child: FutureBuilder<List<CommentsWithMetaRow>>(
                future: CommentsWithMetaTable().queryRows(
                  queryFn: (q) => q
                      .eqOrNull(
                        'parent_comment_id',
                        widget!.comment?.commentId,
                      )
                      .order('created_at'),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return CommentshimmerWidget();
                  }
                  List<CommentsWithMetaRow>
                      listViewreplyCommentsWithMetaRowList = snapshot.data!;

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewreplyCommentsWithMetaRowList.length,
                    separatorBuilder: (_, __) => SizedBox(height: 4.0),
                    itemBuilder: (context, listViewreplyIndex) {
                      final listViewreplyCommentsWithMetaRow =
                          listViewreplyCommentsWithMetaRowList[
                              listViewreplyIndex];
                      return Container(
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.commentcompModels.getModel(
                            listViewreplyIndex.toString(),
                            listViewreplyIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: CommentcompWidget(
                            key: Key(
                              'Keyvhe_${listViewreplyIndex.toString()}',
                            ),
                            index: listViewreplyIndex,
                            comment: listViewreplyCommentsWithMetaRow,
                            like: () async {
                              safeSetState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
