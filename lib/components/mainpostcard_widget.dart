import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'mainpostcard_model.dart';
export 'mainpostcard_model.dart';

class MainpostcardWidget extends StatefulWidget {
  const MainpostcardWidget({
    super.key,
    required this.post,
    bool? iscommented,
    required this.like,
    this.hieg,
  }) : this.iscommented = iscommented ?? false;

  final PostsStruct? post;
  final bool iscommented;
  final Future Function()? like;
  final int? hieg;

  @override
  State<MainpostcardWidget> createState() => _MainpostcardWidgetState();
}

class _MainpostcardWidgetState extends State<MainpostcardWidget> {
  late MainpostcardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainpostcardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.likecount = widget!.post?.likeCount;
          safeSetState(() {});
        }),
        Future(() async {
          if (widget!.post!.likedUserIds.contains(currentUserUid)) {
            _model.isliked = true;
            safeSetState(() {});
          } else {
            _model.isliked = false;
            safeSetState(() {});
          }
        }),
      ]);
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
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
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
                        widget!.post?.userId,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: valueOrDefault<String>(
                      functions.returnimage(widget!.post!.avatarUrl),
                      ' https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzczMjY3NHww&ixlib=rb-4.1.0&q=80&w=1080',
                    ),
                    width: 56.0,
                    height: 56.0,
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.png',
                      width: 56.0,
                      height: 56.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      PostDetailsWidget.routeName,
                      queryParameters: {
                        'post': serializeParam(
                          widget!.post?.id,
                          ParamType.String,
                        ),
                        'from': serializeParam(
                          'home',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.rightToLeft,
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget!.post?.location != null &&
                          widget!.post?.location != '')
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: FlutterFlowTheme.of(context)
                                  .xPRewardsAchievements,
                              size: 16.0,
                            ),
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.post?.location,
                                  'No location',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText2,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.post?.title,
                                      'none ',
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText2,
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
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              functions.formatTimestamp(valueOrDefault<String>(
                                widget!.post?.createdAt,
                                '2hr',
                              )),
                              '2hr',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      font: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText2,
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
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.isExpanded = !_model.isExpanded;
                      safeSetState(() {});
                    },
                    child: Text(
                      valueOrDefault<String>(
                        _model.isExpanded
                            ? valueOrDefault<String>(
                                widget!.post?.content,
                                'content',
                              )
                            : functions.truncateText(
                                valueOrDefault<String>(
                                  widget!.post?.content,
                                  'content',
                                ),
                                50),
                        'In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...  In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...  In the misty dawn of 1928, construction workers reported seeing a figure in old-fashioned clothes walking across the unfinished bridge. Local legend says it’s the spirit of the bridge’s architect, ensuring his masterpiece stands eternal...',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText2,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                if (!_model.isExpanded)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.isExpanded = !_model.isExpanded;
                      safeSetState(() {});
                    },
                    child: Text(
                      valueOrDefault<String>(
                        _model.isExpanded ? 'Show Less' : 'Read More',
                        'Read More',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.raleway(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .xPRewardsAchievements,
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                    ),
                  ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
          Container(
            width: double.infinity,
            height: widget!.hieg?.toDouble(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: FlutterFlowExpandedImageView(
                      image: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: valueOrDefault<String>(
                          functions.returnimage(widget!.post!.mediaUrl),
                          'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzczMjY3NHww&ixlib=rb-4.1.0&q=80&w=1080',
                        ),
                        fit: BoxFit.contain,
                      ),
                      allowRotation: true,
                      tag: valueOrDefault<String>(
                        functions.returnimage(widget!.post!.mediaUrl),
                        'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzczMjY3NHww&ixlib=rb-4.1.0&q=80&w=1080',
                      ),
                      useHeroAnimation: true,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: valueOrDefault<String>(
                  functions.returnimage(widget!.post!.mediaUrl),
                  'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzczMjY3NHww&ixlib=rb-4.1.0&q=80&w=1080',
                ),
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: valueOrDefault<String>(
                      functions.returnimage(widget!.post!.mediaUrl),
                      'https://images.unsplash.com/photo-1640951613773-54706e06851d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHx1c2VyfGVufDB8fHx8MTc2MzczMjY3NHww&ixlib=rb-4.1.0&q=80&w=1080',
                    ),
                    width: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
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
                      Builder(
                        builder: (context) {
                          if (_model.isliked) {
                            return FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.favorite_sharp,
                                color: FlutterFlowTheme.of(context)
                                    .notificationsWarnings,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                if (_model.isliked) {
                                  FFAppState().cachepost = functions
                                      .toggleLikeState(
                                          FFAppState().cachepost.toList(),
                                          widget!.post!.id,
                                          currentUserUid)
                                      .toList()
                                      .cast<dynamic>();
                                  await LikesTable().delete(
                                    matchingRows: (rows) => rows
                                        .eqOrNull(
                                          'post_id',
                                          widget!.post?.id,
                                        )
                                        .eqOrNull(
                                          'user_id',
                                          currentUserUid,
                                        ),
                                  );
                                  _model.isliked = false;
                                  _model.likecount = _model.likecount! + -1;
                                  _model.updatePage(() {});
                                  await widget.like?.call();
                                }
                              },
                            );
                          } else {
                            return FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                FFIcons.kheart,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText2,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                if (!_model.isliked) {
                                  FFAppState().cachepost = functions
                                      .toggleLikeState(
                                          FFAppState().cachepost.toList(),
                                          widget!.post!.id,
                                          currentUserUid)
                                      .toList()
                                      .cast<dynamic>();
                                  await LikesTable().insert({
                                    'post_id': widget!.post?.id,
                                    'user_id': currentUserUid,
                                  });
                                  _model.isliked = true;
                                  _model.likecount = _model.likecount! + 1;
                                  _model.updatePage(() {});
                                  await widget.like?.call();
                                }
                              },
                            );
                          }
                        },
                      ),
                      Text(
                        formatNumber(
                          _model.likecount,
                          formatType: FormatType.compact,
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
                    ].divide(SizedBox(width: 7.0)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 80.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).dMContainer,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        PostDetailsWidget.routeName,
                        queryParameters: {
                          'post': serializeParam(
                            widget!.post?.id,
                            ParamType.String,
                          ),
                          'from': serializeParam(
                            'home',
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    },
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
                            formatNumber(
                              widget!.post?.commentCount,
                              formatType: FormatType.compact,
                            ),
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
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 80.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).dMContainer,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await Share.share(
                          getCurrentRoute(context),
                          sharePositionOrigin: getWidgetBoundingBox(context),
                        );
                      },
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
                            FFLocalizations.of(context).getText(
                              'lim1qnb5' /* 0 */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
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
                        ].divide(SizedBox(width: 7.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
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
