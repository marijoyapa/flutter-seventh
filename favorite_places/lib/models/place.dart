import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

final uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({required this.lat, required this.lng, required this.address});

  final double lat;
  final double lng;
  final String address;
}

class FavovitePlace {
  FavovitePlace({
    required this.name,
    required this.image,
    required this.location,
    String? id
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final File image;
  final PlaceLocation location;
}
