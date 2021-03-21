import 'package:cocktails_db_app/ui/screens/app_scaffold.dart';
import 'package:cocktails_db_app/ui/screens/cocktail_info_scaffold.dart';
import 'package:flutter/material.dart';

/*
  - Hot toddy bag
  - Strawberry margarita bag with Strawberry card
*/

void main() => runApp(
      MaterialApp(
        theme: _myTheme,
        routes: {
          "/": (ctx) => AppScaffold(),
          "/cocktail_info": (ctx) => CocktailInfoScaffold(),
        },
      ),
    );

ThemeData _myTheme = ThemeData.light().copyWith(
  //primaryColor: Colors.pink,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.pink,
    accentColor: Colors.amberAccent,
  ),
);
