import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewContainer extends StatefulWidget {
  @override
  createState() => _MapViewContainerState();
}

class _MapViewContainerState extends State<MapViewContainer> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng currentMarker = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _updateMarker(LatLng latlng) {
    setState(() {
      currentMarker = latlng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onTap: _updateMarker,
        markers: {
          Marker(
            draggable: true,
            onDragEnd: (latlng) => showDialog(
              context: context,
              child: AlertDialog(
                title: Text("hey after draggable"),
              ),
            ),
            onTap: () => showDialog(
              context: context,
              child: AlertDialog(
                title: Text("hey"),
              ),
            ),
            position: currentMarker,
            icon: BitmapDescriptor.defaultMarker,
            markerId: MarkerId("1234"),
          )
        },
        initialCameraPosition: CameraPosition(
          target: currentMarker,
          zoom: 11.0,
        ),
      ),
    );
  }
}
