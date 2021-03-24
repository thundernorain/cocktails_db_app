import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/model/screen_args.dart';
import 'package:cocktails_db_app/ui/widgets/drawer/drawer_list_tile.dart';
import 'package:cocktails_db_app/ui/widgets/drawer/logo_drawer.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            LogoInDrawer(),
            DrawerListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => Navigator.of(context).pushReplacementNamed("/"),
            ),
            DrawerListTile(
              leading: Icon(Icons.category),
              title: Text("Categories"),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed("/categories_list"),
            ),
            DrawerListTile(
              leading: Icon(Icons.icecream),
              title: Text("Ingredients"),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed("/ingredient_list"),
            ),
            DrawerListTile(
              leading: Icon(Icons.no_drinks),
              title: Text("Non-alcoholic"),
              onTap: () => _onNonAlcoholicTileTap(context),
            ),
            DrawerListTile(
              leading: Icon(Icons.wine_bar),
              title: Text("Glass"),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed("/glass_list"),
            ),
            DrawerListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () => Navigator.of(context).pushReplacementNamed("/about"),
            ),
          ],
        ),
      ),
    );
  }
}

_onNonAlcoholicTileTap(BuildContext context) =>
    Navigator.of(context).pushReplacementNamed(
      "/filter_cocktails",
      arguments: ScreenArgs(() => Network().filterByNonAlcoholic()),
    );
