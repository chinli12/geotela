import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calenderload_model.dart';
export 'calenderload_model.dart';

class CalenderloadWidget extends StatefulWidget {
  const CalenderloadWidget({super.key});

  @override
  State<CalenderloadWidget> createState() => _CalenderloadWidgetState();
}

class _CalenderloadWidgetState extends State<CalenderloadWidget> {
  late CalenderloadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderloadModel());

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
      height: 291.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: FlutterFlowCalendar(
        color: FlutterFlowTheme.of(context).xPRewardsAchievements,
        iconColor: FlutterFlowTheme.of(context).secondaryText,
        weekFormat: false,
        weekStartsMonday: false,
        initialDate: getCurrentTimestamp,
        rowHeight: 48.0,
        onChange: (DateTimeRange? newSelectedDate) {
          safeSetState(() => _model.calendarSelectedDay = newSelectedDate);
        },
        titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
              font: GoogleFonts.raleway(
                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
            ),
        dayOfWeekStyle: FlutterFlowTheme.of(context).bodyLarge.override(
              font: GoogleFonts.raleway(
                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
            ),
        dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.raleway(
                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
        selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.raleway(
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium.override(
              font: GoogleFonts.raleway(
                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
            ),
        locale: FFLocalizations.of(context).languageCode,
      ),
    );
  }
}
