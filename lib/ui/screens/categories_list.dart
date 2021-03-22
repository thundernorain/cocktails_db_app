import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/ui/widgets/category_card.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_grid_builder.dart';
import 'package:cocktails_db_app/ui/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: CategoriesListBody(),
    );
  }
}

class CategoriesListBody extends StatefulWidget {
  @override
  _CategoriesListBodyState createState() => _CategoriesListBodyState();
}

class _CategoriesListBodyState extends State<CategoriesListBody> {
  late Future<CocktailFromJson> categories;

  @override
  void initState() {
    super.initState();
    categories = Network().getCategoriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: categories,
          builder: (context, AsyncSnapshot<CocktailFromJson> snapshot) =>
              snapshot.hasData
                  ? CocktailGridBuilder(
                      cocktails: snapshot.data!,
                      itemBuilder: (context, i) => CategoryCard(
                          name: snapshot.data!.drinks[i].strCategory!))
                  : _snapshotWithoutData(snapshot),
        ),
      ],
    );
  }
}

Widget _snapshotWithoutData(AsyncSnapshot<CocktailFromJson> snapshot) =>
    snapshot.hasError
        ? Center(
            child: Text("Error getting data"),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
