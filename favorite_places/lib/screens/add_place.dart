import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/favorite_place.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
// import 'package:';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? imageFile;
  PlaceLocation? pickedLocation;

  void addPlace() {
    if (_titleController.text.isEmpty || imageFile == null || pickedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All fields must be populated')));
      return;
    }
    ref.read(favoriteMealsProvider.notifier).addFavoritePlace(
        FavovitePlace(name: _titleController.text, image: imageFile!, location: pickedLocation!));
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 16),
            ImageInput(
              onPickImage: (file) => imageFile = file,
            ),
            const SizedBox(height: 16),
            LocationInput(
              pickedLocation: (location) => pickedLocation = location,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
                onPressed: addPlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'))
          ],
        ),
      ),
    );
  }
}
