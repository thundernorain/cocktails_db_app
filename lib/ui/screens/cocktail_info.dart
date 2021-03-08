import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:flutter/material.dart';

class CocktailInfo extends StatelessWidget {
  final CocktailFromJson cocktails;
  final int drinkIndex;

  const CocktailInfo(
      {Key? key, required this.cocktails, required this.drinkIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Center(
            child: Text(cocktails.drinks[drinkIndex].strDrink ?? "No name"),
          )
        ],
      ),
    );
  }
}
