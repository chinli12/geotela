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
import 'postcardshimer_model.dart';
export 'postcardshimer_model.dart';

class PostcardshimerWidget extends StatefulWidget {
  const PostcardshimerWidget({super.key});

  @override
  State<PostcardshimerWidget> createState() => _PostcardshimerWidgetState();
}

class _PostcardshimerWidgetState extends State<PostcardshimerWidget>
    with TickerProviderStateMixin {
  late PostcardshimerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostcardshimerModel());

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
          width: double.infinity,
          height: 310.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
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
                        color: Color(0x0A57636C),
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
                                child: Container(
                                  width: 160.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x0A57636C),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Color(0x0A57636C),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ].divide(SizedBox(width: 30.0)),
                          ),
                          Container(
                            width: 280.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Color(0x0A57636C),
                              borderRadius: BorderRadius.circular(13.0),
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
                    color: Color(0x0A57636C),
                    borderRadius: BorderRadius.circular(8.0),
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
                        color: Color(0x0A57636C),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: Color(0x0A57636C),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: Color(0x0A57636C),
                        borderRadius: BorderRadius.circular(16.0),
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
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!);
  }
}
