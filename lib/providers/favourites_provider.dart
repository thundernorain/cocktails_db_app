import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  /// Contains an id of favorite cocktails
  List<String> _favoritesList = [];

  /// Returns an id of favorite cocktails
  List<String> get favorites {
    return [..._favoritesList];
  }

  addToFavorites(String id) {
    _favoritesList.add(id);
  }

  deleteFromFavorites(String id) {
    _favoritesList.removeWhere(
      (element) => element == id,
    );
  }
}
