import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favourites_provider.dart';
import '../widgets/favorites_grid.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with AutomaticKeepAliveClientMixin<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoritesData = Provider.of<FavoritesProvider>(context);
    final favoritesList = favoritesData.favorites;

    return favoritesList.length > 0
        ? FavoritesGrid(favoritesList: favoritesList)
        : Center(
            child: Text("Favorites list is empty"),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
