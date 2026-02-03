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
import 'tripshimma_model.dart';
export 'tripshimma_model.dart';

class TripshimmaWidget extends StatefulWidget {
  const TripshimmaWidget({super.key});

  @override
  State<TripshimmaWidget> createState() => _TripshimmaWidgetState();
}

class _TripshimmaWidgetState extends State<TripshimmaWidget>
    with TickerProviderStateMixin {
  late TripshimmaModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripshimmaModel());

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
          width: 355.0,
          height: 159.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0x1C57636C),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0x1C57636C),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0x1C57636C),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: Color(0x1C57636C),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['blurOnPageLoadAnimation']!);
  }
}
