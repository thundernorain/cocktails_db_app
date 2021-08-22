import 'package:cocktails_db_app/ui/screens/cocktail_info.dart';
import 'package:flutter/material.dart';

class CocktailInfoScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final String id = routeArgs["id"] as String;

    return Scaffold(
      body: CocktailInfo(
        id: id,
      ),
    );
  }
}
