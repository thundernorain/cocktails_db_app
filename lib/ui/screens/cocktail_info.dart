import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_image.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_info_body.dart';
import 'package:cocktails_db_app/ui/widgets/favorites_button.dart';
import 'package:flutter/material.dart';

class CocktailInfo extends StatefulWidget {
  final String id;

  const CocktailInfo({Key? key, required this.id}) : super(key: key);

  @override
  _CocktailInfoState createState() => _CocktailInfoState();
}

class _CocktailInfoState extends State<CocktailInfo> {
  late Future<CocktailFromJson> cocktail;

  @override
  void initState() {
    super.initState();
    cocktail = Network().lookupCocktailById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cocktail,
      builder: (context, AsyncSnapshot<CocktailFromJson> snapshot) =>
          snapshot.hasData
              ? CocktailInfoHead(cocktail: snapshot.data!)
              : _snapshotWithoutData(snapshot),
    );
  }
}

class CocktailInfoHead extends StatelessWidget {
  final CocktailFromJson cocktail;

  const CocktailInfoHead({
    Key? key,
    required this.cocktail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Stack(
            children: [
              CocktailImage(
                imageUrl: cocktail.drinks[0].strDrinkThumb,
              ),
              Align(
                alignment: Alignment.topRight,
                child:
                    FavoritesButton(idOfCocktail: cocktail.drinks[0].idDrink!),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(
              cocktail.drinks[0].strDrink ?? "No name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          CocktailInfoBody(
            cocktails: cocktail,
            drinkIndex: 0,
          ),
        ],
      ),
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
