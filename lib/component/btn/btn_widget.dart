import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'btn_model.dart';
export 'btn_model.dart';

class BtnWidget extends StatefulWidget {
  const BtnWidget({super.key});

  @override
  State<BtnWidget> createState() => _BtnWidgetState();
}

class _BtnWidgetState extends State<BtnWidget> {
  late BtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BtnModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: FFLocalizations.of(context).getText(
        'qufpy1xg' /* Save */,
      ),
      options: FFButtonOptions(
        width: 126.0,
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).alternate,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              fontSize: 12.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
