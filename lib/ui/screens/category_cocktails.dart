import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_card.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_grid_builder.dart';
import 'package:cocktails_db_app/ui/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class CategoryCocktails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final String category = routeArgs["category"] as String;

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: CategoryCocktailsBody(
        category: category,
      ),
    );
  }
}

class CategoryCocktailsBody extends StatefulWidget {
  final String category;

  const CategoryCocktailsBody({Key? key, required this.category})
      : super(key: key);
  @override
  _CategoryCocktailsBodyState createState() => _CategoryCocktailsBodyState();
}

class _CategoryCocktailsBodyState extends State<CategoryCocktailsBody> {
  late Future<CocktailFromJson> cocktails;

  @override
  void initState() {
    super.initState();
    cocktails = Network().filterByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: cocktails,
          builder: (context, AsyncSnapshot<CocktailFromJson> snapshot) =>
              snapshot.hasData
                  ? CocktailGridBuilder(
                      cocktails: snapshot.data!,
                      itemBuilder: (context, i) => CocktailCard(
                          cocktails: snapshot.data!, drinkIndex: i))
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
