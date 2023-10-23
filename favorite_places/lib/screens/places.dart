import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/places_details.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/providers/favorite_place.dart';

class FavoriteListScreen extends ConsumerWidget {
  const FavoriteListScreen({super.key});

  void addPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPlaceScreen(),
      ),
    );
  }

  void navigateSpecificPlace(BuildContext context, FavovitePlace place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceScreen(place: place),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePlaces = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              addPlace(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: PlaceLists(places: favoritePlaces)),
    );
  }
}
