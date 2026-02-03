import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'daystreak_model.dart';
export 'daystreak_model.dart';

class DaystreakWidget extends StatefulWidget {
  const DaystreakWidget({super.key});

  @override
  State<DaystreakWidget> createState() => _DaystreakWidgetState();
}

class _DaystreakWidgetState extends State<DaystreakWidget> {
  late DaystreakModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DaystreakModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProfilesRow>>(
      future: ProfilesTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).mainBrandColorSuccessExploration,
                ),
              ),
            ),
          );
        }
        List<ProfilesRow> textProfilesRowList = snapshot.data!;

        final textProfilesRow =
            textProfilesRowList.isNotEmpty ? textProfilesRowList.first : null;

        return Text(
          FFLocalizations.of(context).getText(
            'czrvw6dl' /* 0 */,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).xPRewardsAchievements,
                fontSize: 64.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
        );
      },
    );
  }
}
