import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'groupddshimmer_model.dart';
export 'groupddshimmer_model.dart';

class GroupddshimmerWidget extends StatefulWidget {
  const GroupddshimmerWidget({super.key});

  @override
  State<GroupddshimmerWidget> createState() => _GroupddshimmerWidgetState();
}

class _GroupddshimmerWidgetState extends State<GroupddshimmerWidget> {
  late GroupddshimmerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupddshimmerModel());

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
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        color: Color(0x1A64748B),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Icon(
          Icons.add,
          color: Color(0xFFAAAAAD),
          size: 16.0,
        ),
      ),
    );
  }
}
