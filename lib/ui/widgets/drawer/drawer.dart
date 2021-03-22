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
                leading: Icon(Icons.icecream), title: Text("Ingredients")),
            DrawerListTile(
                leading: Icon(Icons.no_drinks), title: Text("Non-alcoholic")),
            DrawerListTile(leading: Icon(Icons.wine_bar), title: Text("Glass")),
            DrawerListTile(leading: Icon(Icons.info), title: Text("About")),
          ],
        ),
      ),
    );
  }
}
