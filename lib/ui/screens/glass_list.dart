import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/model/screen_args.dart';
import 'package:cocktails_db_app/ui/widgets/grid_card.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_grid_builder.dart';
import 'package:cocktails_db_app/ui/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class GlassList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Glasses"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: GlassListBody(),
    );
  }
}

class GlassListBody extends StatefulWidget {
  @override
  _GlassListBodyState createState() => _GlassListBodyState();
}

class _GlassListBodyState extends State<GlassListBody> {
  late Future<CocktailFromJson> categories;

  @override
  void initState() {
    super.initState();
    categories = Network().getGlassList();
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
                          name: snapshot.data!.drinks[i].strGlass!,
                        ),
                        onTap: () =>
                            _onTap(context, snapshot.data!.drinks[i].strGlass!),
                      ),
                    )
                  : _snapshotWithoutData(snapshot),
        ),
      ],
    );
  }
}

_onTap(BuildContext context, String glass) =>
    Navigator.of(context).pushNamed("/filter_cocktails",
        arguments: ScreenArgs(() => _getFuture(glass)));

Future<CocktailFromJson> _getFuture(String glass) =>
    Network().filterByGlass(glass);

Widget _snapshotWithoutData(AsyncSnapshot<CocktailFromJson> snapshot) =>
    snapshot.hasError
        ? Center(
            child: Text("Error getting data"),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
