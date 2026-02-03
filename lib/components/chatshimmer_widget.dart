import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chatshimmer_model.dart';
export 'chatshimmer_model.dart';

class ChatshimmerWidget extends StatefulWidget {
  const ChatshimmerWidget({super.key});

  @override
  State<ChatshimmerWidget> createState() => _ChatshimmerWidgetState();
}

class _ChatshimmerWidgetState extends State<ChatshimmerWidget> {
  late ChatshimmerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatshimmerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 80.0,
                            height: 40.0,
                            constraints: BoxConstraints(
                              maxWidth: 285.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0x50E0E3E7),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0x50E0E3E7),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x50E0E3E7),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  Container(
                                    width: 70.0,
                                    height: 40.0,
                                    constraints: BoxConstraints(
                                      maxWidth: 285.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0x50E0E3E7),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 80.0,
                            height: 40.0,
                            constraints: BoxConstraints(
                              maxWidth: 285.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0x50E0E3E7),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0x50E0E3E7),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x09E0E3E7),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  Container(
                                    width: 70.0,
                                    height: 40.0,
                                    constraints: BoxConstraints(
                                      maxWidth: 285.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0x50E0E3E7),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 10.0)),
                      ),
                    ]
                        .divide(SizedBox(height: 24.0))
                        .addToEnd(SizedBox(height: 100.0)),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Color(0x50E0E3E7),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0x50E0E3E7),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 40.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: Color(0x50E0E3E7),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0x50E0E3E7),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
