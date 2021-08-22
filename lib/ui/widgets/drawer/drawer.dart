import 'package:cocktails_db_app/main.dart';
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
              onTap: () => Navigator.of(context).pushReplacementNamed(ROUTE_ROOT),
            ),
            DrawerListTile(
              leading: Icon(Icons.category),
              title: Text("Categories"),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(ROUTE_CATEGORIES_LIST),
            ),
            DrawerListTile(
              leading: Icon(Icons.icecream),
              title: Text("Ingredients"),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(ROUTE_INGREDIENT_LIST),
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
                  Navigator.of(context).pushReplacementNamed(ROUTE_GLASS_LIST),
            ),
            DrawerListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () => Navigator.of(context).pushReplacementNamed(ROUTE_ABOUT),
            ),
          ],
        ),
      ),
    );
  }
}

_onNonAlcoholicTileTap(BuildContext context) =>
    Navigator.of(context).pushReplacementNamed(
      ROUTE_FILTER_COCKTAILS,
      arguments: ScreenArgs(() => Network().filterByNonAlcoholic()),
    );
