import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/places_details.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/providers/favorite_place.dart';

class FavoriteListScreen extends ConsumerStatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FavoriteListScreenState();
  }
}

class _FavoriteListScreenState extends ConsumerState<FavoriteListScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(favoriteMealsProvider.notifier).loadPlaces();
  }

  void addPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPlaceScreen(),
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
  Widget build(BuildContext context) {
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
        child: FutureBuilder(
          future: _placesFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : PlaceLists(
                      places: favoritePlaces,
                    ),
        ),
      ),
    );
  }
}
