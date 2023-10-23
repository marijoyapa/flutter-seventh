import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<FavovitePlace>> {
  UserPlacesNotifier() : super(const []);

  void addFavoritePlace(FavovitePlace place) {
    
    state = [...state, place];
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<UserPlacesNotifier, List<FavovitePlace>>(
        (ref) => UserPlacesNotifier());
