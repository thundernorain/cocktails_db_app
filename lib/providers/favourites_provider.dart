import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class FavoritesProvider with ChangeNotifier {
  static const BOX_NAME = "favorites";

  /// Contains an id of favorite cocktails
  List<String> _favoritesList = [];

  /// Returns an id of favorite cocktails
  List<String> get favorites {
    if (_favoritesList.isEmpty) {
      _favoritesList = [..._loadFavoritesFromDB()];
    }

    return [..._favoritesList];
  }

  List<String> _loadFavoritesFromDB() {
    var box = Hive.box<List<String>>(BOX_NAME);
    List<String> favorites = box.get("list") ?? [];

    return favorites;
  }

  addToFavorites(String id) {
    _favoritesList.add(id);

    var box = Hive.box<List<String>>(BOX_NAME);
    box.put("list", _favoritesList);

    notifyListeners();
  }

  deleteFromFavorites(String id) {
    _favoritesList.removeWhere(
      (element) => element == id,
    );

    var box = Hive.box<List<String>>(BOX_NAME);
    box.put("list", _favoritesList);

    notifyListeners();
  }
}
