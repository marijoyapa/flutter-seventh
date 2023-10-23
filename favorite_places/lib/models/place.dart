import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

final uuid = Uuid();

class FavovitePlace {
  FavovitePlace({required this.name, required this.path}) :id = uuid.v4();

  final String id;
  final String name;
  final File path;
}
