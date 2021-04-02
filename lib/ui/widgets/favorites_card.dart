import 'package:flutter/material.dart';

import '../../model/cocktail_from_json.dart';
import '../../model/network.dart';
import './cocktail_card.dart';

class FavoritesCard extends StatefulWidget {
  final String id;

  const FavoritesCard({Key? key, required this.id}) : super(key: key);

  @override
  _FavoritesCardState createState() => _FavoritesCardState();
}

class _FavoritesCardState extends State<FavoritesCard> {
  late Future<CocktailFromJson> cocktail;

  @override
  void initState() {
    super.initState();
    cocktail = Network().lookupCocktailById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cocktail,
      builder: (context, AsyncSnapshot<CocktailFromJson> snapshot) =>
          snapshot.hasData
              ? CocktailCard(
                  cocktails: snapshot.data!,
                  drinkIndex: 0,
                )
              : _snapshotWithoutData(snapshot),
    );
  }
}

Widget _snapshotWithoutData(AsyncSnapshot snapshot) => snapshot.hasError
    ? Center(
        child: Text("Error"),
      )
    : CircularProgressIndicator();
