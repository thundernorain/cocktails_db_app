import 'package:cocktails_db_app/ui/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: AboutScreenBody(),
    );
  }
}

class AboutScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Text(
              "Made by Fattakhov Artur",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text("App working with CocktailDB API"),
            InkWell(
              child: Text(
                "Open CocktailDB website",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () async => await launch("https://www.thecocktaildb.com/"),
            )
          ],
        ),
      ),
    );
  }
}
