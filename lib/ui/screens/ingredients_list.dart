import 'package:cocktails_db_app/model/screen_args.dart';
import 'package:flutter/material.dart';

import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/ui/widgets/grid_card.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_grid_builder.dart';
import 'package:cocktails_db_app/ui/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class IngredientsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Ingredients"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: IngredientsListBody(),
    );
  }
}

class IngredientsListBody extends StatefulWidget {
  @override
  _IngredientsListBodyState createState() => _IngredientsListBodyState();
}

class _IngredientsListBodyState extends State<IngredientsListBody> {
  late Future<CocktailFromJson> categories;

  @override
  void initState() {
    super.initState();
    categories = Network().getIngredientsList();
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
                      itemBuilder: (context, i) {
                        final String? ingredient =
                            snapshot.data!.drinks[i].strIngredient1;
                        return InkWell(
                          child: GridCard(
                              name: ingredient!,
                              image: Constants.getIngredientImage(ingredient)),
                          onTap: () => _onTap(context, ingredient),
                        );
                      },
                    )
                  : _snapshotWithoutData(snapshot),
        ),
      ],
    );
  }
}

_onTap(BuildContext context, String ingredient) =>
    Navigator.of(context).pushNamed("/filter_cocktails",
        arguments: ScreenArgs(() => _getFuture(ingredient)));

Future<CocktailFromJson> _getFuture(String ingredient) =>
    Network().filterByIngredient(ingredient);

Widget _snapshotWithoutData(AsyncSnapshot<CocktailFromJson> snapshot) =>
    snapshot.hasError
        ? Center(
            child: Text("Error getting data"),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
