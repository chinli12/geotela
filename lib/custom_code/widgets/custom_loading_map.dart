// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as m;
import 'dart:async';

class CustomLoadingMap extends StatefulWidget {
  const CustomLoadingMap({
    Key? key,
    this.width,
    this.height,
    required this.centerLat,
    required this.centerLng,
    this.markers,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double centerLat;
  final double centerLng;
  final List<LatLng>? markers;

  @override
  _CustomLoadingMapState createState() => _CustomLoadingMapState();
}

class _CustomLoadingMapState extends State<CustomLoadingMap> {
  // 1. State variable to track loading
  bool _isLoading = true;

  // Controller
  Completer<m.GoogleMapController> _controller = Completer();

  // 2. FIX: Changed return type from 'BytesMapBitmapMarker' to 'Marker'
  Set<m.Marker> _createMarkers() {
    if (widget.markers == null) return {};

    return widget.markers!.map((latlng) {
      return m.Marker(
        markerId: m.MarkerId(latlng.toString()),
        // Convert FlutterFlow LatLng to Google Maps LatLng
        position: m.LatLng(latlng.latitude, latlng.longitude),
        infoWindow: m.InfoWindow(title: "Story Location"),
        icon:
            m.BitmapDescriptor.defaultMarkerWithHue(m.BitmapDescriptor.hueRed),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // LAYER 1: The Google Map
          m.GoogleMap(
            mapType: m.MapType.normal,
            initialCameraPosition: m.CameraPosition(
              target: m.LatLng(widget.centerLat, widget.centerLng),
              zoom: 14.0,
            ),
            markers: _createMarkers(), // <--- Now uses the correct function
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            // CRITICAL: This callback runs when map is fully initialized
            onMapCreated: (m.GoogleMapController controller) {
              _controller.complete(controller);

              // Add a tiny delay to ensure the frame is painted
              Future.delayed(Duration(milliseconds: 500), () {
                if (mounted) {
                  setState(() {
                    _isLoading = false; // Hides the loader
                  });
                }
              });
            },
          ),

          // LAYER 2: The Loading Indicator
          if (_isLoading)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: FlutterFlowTheme.of(context).primaryBackground,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Loading Map...",
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
