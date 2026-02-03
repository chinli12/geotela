import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'likecomp_model.dart';
export 'likecomp_model.dart';

class LikecompWidget extends StatefulWidget {
  const LikecompWidget({super.key});

  @override
  State<LikecompWidget> createState() => _LikecompWidgetState();
}

class _LikecompWidgetState extends State<LikecompWidget> {
  late LikecompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikecompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FFIcons.kheart,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 16.0,
        ),
        Text(
          FFLocalizations.of(context).getText(
            '5yj9j5g3' /* 0 */,
          ),
          style: FlutterFlowTheme.of(context).bodySmall.override(
                font: GoogleFonts.raleway(
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText2,
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
              ),
        ),
      ].divide(SizedBox(width: 7.0)),
    );
  }
}
