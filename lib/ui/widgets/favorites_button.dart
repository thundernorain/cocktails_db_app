import 'package:cocktails_db_app/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesButton extends StatefulWidget {
  final String idOfCocktail;

  const FavoritesButton({Key? key, required this.idOfCocktail})
      : super(key: key);

  @override
  _FavoritesButtonState createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton> {
  @override
  Widget build(BuildContext context) {
    final favoritesList = Provider.of<FavoritesProvider>(context).favorites;

    return InkWell(
      onTap: () {
        _onTap(context, favoritesList, widget.idOfCocktail);
        setState(() {});
      },
      child: Container(
        child: favoritesList.contains(widget.idOfCocktail)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
      ),
    );
  }
}

_onTap(BuildContext context, List favoritesList, String id) {
  if (favoritesList.contains(id)) {
    Provider.of<FavoritesProvider>(context, listen: false)
        .deleteFromFavorites(id);
  } else {
    Provider.of<FavoritesProvider>(context, listen: false).addToFavorites(id);
  }
}
