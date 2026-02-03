import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'commentshimmer_model.dart';
export 'commentshimmer_model.dart';

class CommentshimmerWidget extends StatefulWidget {
  const CommentshimmerWidget({super.key});

  @override
  State<CommentshimmerWidget> createState() => _CommentshimmerWidgetState();
}

class _CommentshimmerWidgetState extends State<CommentshimmerWidget>
    with TickerProviderStateMixin {
  late CommentshimmerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentshimmerModel());

    animationsMap.addAll({
      'blurOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0xFFF2F7FD),
            angle: 0.524,
          ),
        ],
      ),
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
    return ClipRect(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Container(
          height: 180.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
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
                              Container(
                                width: 100.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0x0957636C),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Color(0x0957636C),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ].divide(SizedBox(width: 30.0)),
                          ),
                          Container(
                            width: 200.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Color(0x0957636C),
                              borderRadius: BorderRadius.circular(12.0),
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
                    Container(
                      width: 109.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: Color(0x0957636C),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    Container(
                      width: 109.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: Color(0x0957636C),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 100.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0x0957636C),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: Color(0x0957636C),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!);
  }
}
