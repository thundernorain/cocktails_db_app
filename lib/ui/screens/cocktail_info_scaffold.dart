import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/ui/screens/cocktail_info.dart';
import 'package:flutter/material.dart';

class CocktailInfoScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final CocktailFromJson cocktails =
        routeArgs["cocktails"] as CocktailFromJson;
    final int drinkIndex = routeArgs["drinkIndex"] as int;

    return Scaffold(
      body: CocktailInfo(
        cocktails: cocktails,
        drinkIndex: drinkIndex,
      ),
    );
  }
}
