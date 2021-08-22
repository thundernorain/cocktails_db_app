import 'package:cocktails_db_app/main.dart';
import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/model/screen_args.dart';
import 'package:cocktails_db_app/ui/widgets/grid_card.dart';
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
                      itemBuilder: (context, i) => InkWell(
                        child: GridCard(
                          name: snapshot.data!.drinks[i].strCategory!,
                        ),
                        onTap: () => _onTap(
                            context, snapshot.data!.drinks[i].strCategory!),
                      ),
                    )
                  : _snapshotWithoutData(snapshot),
        ),
      ],
    );
  }
}

_onTap(BuildContext context, String category) =>
    Navigator.of(context).pushNamed(ROUTE_FILTER_COCKTAILS,
        arguments: ScreenArgs(() => _getFuture(category)));

Future<CocktailFromJson> _getFuture(String category) =>
    Network().filterByCategory(category);

Widget _snapshotWithoutData(AsyncSnapshot<CocktailFromJson> snapshot) =>
    snapshot.hasError
        ? Center(
            child: Text("Error getting data"),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
