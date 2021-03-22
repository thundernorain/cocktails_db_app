import 'package:cocktails_db_app/ui/screens/app_scaffold.dart';
import 'package:cocktails_db_app/ui/screens/categories_list.dart';
import 'package:cocktails_db_app/ui/screens/category_cocktails.dart';
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
          "/categories_list": (ctx) => CategoriesList(),
          "/filter_category": (ctx) => CategoryCocktails(),
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
