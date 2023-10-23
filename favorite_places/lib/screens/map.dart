import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/places_details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.location =
          const PlaceLocation(lat: 37.4222, lng: -122.084, address: ''),
      this.isSelecting = true});

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  void onSaveLocation() {
    Navigator.of(context).pop(
      _pickedLocation
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Pick location' : 'Your location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: onSaveLocation,
              icon: const Icon(Icons.save),
            )
        ],
      ),
      body: GoogleMap(
        onTap: (!widget.isSelecting) ? null : (position) => setState(() {
          _pickedLocation = position;
        }),
        initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.location.lat,
              widget.location.lng,
            ),
            zoom: 16),
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedLocation ??
                      LatLng(
                        widget.location.lat,
                        widget.location.lng,
                      ),
                ),
              },
      ),
    );
  }
}
