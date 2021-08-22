import 'package:cocktails_db_app/create_material_color.dart';
import 'package:cocktails_db_app/providers/favourites_provider.dart';
import 'package:cocktails_db_app/ui/screens/about_screen.dart';
import 'package:cocktails_db_app/ui/screens/app_scaffold.dart';
import 'package:cocktails_db_app/ui/screens/categories_list.dart';
import 'package:cocktails_db_app/ui/screens/filter_cocktails.dart';
import 'package:cocktails_db_app/ui/screens/cocktail_info_scaffold.dart';
import 'package:cocktails_db_app/ui/screens/glass_list.dart';
import 'package:cocktails_db_app/ui/screens/ingredients_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
  - Hot toddy bag
  - Strawberry margarita bag with Strawberry card
*/

const ROUTE_ROOT = "/";
const ROUTE_COCKTAIL_INFO = "/cocktail_info";
const ROUTE_CATEGORIES_LIST = "/categories_list";
const ROUTE_INGREDIENT_LIST = "/ingredient_list";
const ROUTE_GLASS_LIST = "/glass_list";
const ROUTE_FILTER_COCKTAILS = "/filter_cocktails";
const ROUTE_ABOUT = "/about";

void main() => runApp(
      ChangeNotifierProvider(
        create: (ctx) => FavoritesProvider(),
        child: MyMaterialApp(),
      ),
    );

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _myTheme,
      routes: {
        ROUTE_ROOT: (ctx) => AppScaffold(),
        ROUTE_COCKTAIL_INFO: (ctx) => CocktailInfoScaffold(),
        ROUTE_CATEGORIES_LIST: (ctx) => CategoriesList(),
        ROUTE_INGREDIENT_LIST: (ctx) => IngredientsList(),
        ROUTE_GLASS_LIST: (ctx) => GlassList(),
        ROUTE_FILTER_COCKTAILS: (ctx) => FilterCocktails(),
        ROUTE_ABOUT: (ctx) => AboutScreen(),
      },
    );
  }
}

ThemeData _myTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: CreateMaterialColor()
        .createMaterialColor(Color.fromRGBO(186, 104, 200, 1)),
    accentColor: Colors.amberAccent,
  ),
);
