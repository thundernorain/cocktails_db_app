import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/screen_args.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_card.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_grid_builder.dart';
import 'package:cocktails_db_app/ui/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class FilterCocktails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    final Function getFutureFunction = routeArgs.function;

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: FilterCocktailsBody(
        getFutureFunction: getFutureFunction,
      ),
    );
  }
}

class FilterCocktailsBody extends StatefulWidget {
  final Function getFutureFunction;

  const FilterCocktailsBody({Key? key, required this.getFutureFunction})
      : super(key: key);
  @override
  _FilterCocktailsBodyState createState() => _FilterCocktailsBodyState();
}

class _FilterCocktailsBodyState extends State<FilterCocktailsBody> {
  late Future<CocktailFromJson> cocktails;

  @override
  void initState() {
    super.initState();
    cocktails = widget.getFutureFunction();
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
