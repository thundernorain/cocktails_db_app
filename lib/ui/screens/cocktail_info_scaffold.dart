import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/ui/screens/cocktail_info.dart';
import 'package:flutter/material.dart';

class CocktailInfoScaffold extends StatelessWidget {
  final CocktailFromJson cocktails;
  final int drinkIndex;

  const CocktailInfoScaffold(
      {Key? key, required this.cocktails, required this.drinkIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CocktailInfo(
        cocktails: cocktails,
        drinkIndex: drinkIndex,
      ),
    );
  }
}
