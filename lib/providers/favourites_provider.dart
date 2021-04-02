import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  /// Contains an id of favorite cocktails
  List<String> _favoritesList = [];

  /// Returns an id of favorite cocktails
  List<String> get favorites {
    return [..._favoritesList];
  }
}
