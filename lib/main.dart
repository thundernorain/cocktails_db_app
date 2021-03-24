import 'package:cocktails_db_app/ui/screens/about_screen.dart';
import 'package:cocktails_db_app/ui/screens/app_scaffold.dart';
import 'package:cocktails_db_app/ui/screens/categories_list.dart';
import 'package:cocktails_db_app/ui/screens/filter_cocktails.dart';
import 'package:cocktails_db_app/ui/screens/cocktail_info_scaffold.dart';
import 'package:cocktails_db_app/ui/screens/glass_list.dart';
import 'package:cocktails_db_app/ui/screens/ingredients_list.dart';
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
          "/ingredient_list": (ctx) => IngredientsList(),
          "/glass_list": (ctx) => GlassList(),
          "/filter_cocktails": (ctx) => FilterCocktails(),
          "/about": (ctx) => AboutScreen(),
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
