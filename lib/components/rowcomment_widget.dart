import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rowcomment_model.dart';
export 'rowcomment_model.dart';

class RowcommentWidget extends StatefulWidget {
  const RowcommentWidget({super.key});

  @override
  State<RowcommentWidget> createState() => _RowcommentWidgetState();
}

class _RowcommentWidgetState extends State<RowcommentWidget> {
  late RowcommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowcommentModel());

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
              FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: Icon(
                  FFIcons.kheart,
                  color: FlutterFlowTheme.of(context).secondaryText2,
                  size: 20.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '9pez0upa' /* 0 */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.raleway(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText2,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                Icons.chat_bubble_outline,
                color: FlutterFlowTheme.of(context).secondaryText2,
                size: 25.0,
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'yab8r0f1' /* 0 */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.raleway(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                      color: Color(0xFF64748B),
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                FFLocalizations.of(context).getText(
                  '3hjuxrct' /* 0 */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.raleway(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                      color: Color(0xFF64748B),
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
              ),
            ].divide(SizedBox(width: 7.0)),
          ),
        ),
      ],
    );
  }
}
