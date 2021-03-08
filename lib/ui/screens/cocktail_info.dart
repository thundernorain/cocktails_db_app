import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_image.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_info_body.dart';
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
          CocktailImage(
            imageUrl: cocktails.drinks[drinkIndex].strDrinkThumb,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(
              cocktails.drinks[drinkIndex].strDrink ?? "No name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          CocktailInfoBody(
            cocktails: cocktails,
            drinkIndex: drinkIndex,
          ),
        ],
      ),
    );
  }
}
