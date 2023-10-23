import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/places_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceLists extends ConsumerWidget {
  const PlaceLists({super.key, required this.places});

  final List<FavovitePlace> places;

  void navigateSpecificPlace(BuildContext context, FavovitePlace place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PlaceScreen(place: place),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = Center(
      child: Text(
        'No places added yet',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(places[index].image),
            radius: 26,
          ),
          onTap: () {
            navigateSpecificPlace(context, places[index]);
          },
          title: Text(
            places[index].name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          subtitle: Text(
            places[index].location.address,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      );
    }
    return content;
  }
}
