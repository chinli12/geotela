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
import 'tripshima1_model.dart';
export 'tripshima1_model.dart';

class Tripshima1Widget extends StatefulWidget {
  const Tripshima1Widget({super.key});

  @override
  State<Tripshima1Widget> createState() => _Tripshima1WidgetState();
}

class _Tripshima1WidgetState extends State<Tripshima1Widget>
    with TickerProviderStateMixin {
  late Tripshima1Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Tripshima1Model());

    animationsMap.addAll({
      'blurOnPageLoadAnimation': AnimationInfo(
        loop: true,
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
          sigmaX: 1.0,
          sigmaY: 1.0,
        ),
        child: Container(
          width: double.infinity,
          height: 73.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Color(0x1A57636C),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: 120.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                        color: Color(0x1A57636C),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0x1A64748B),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!);
  }
}
