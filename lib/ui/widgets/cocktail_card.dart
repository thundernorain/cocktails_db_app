import 'package:cocktails_db_app/constants.dart';
import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:flutter/material.dart';

class CocktailCard extends StatelessWidget {
  final CocktailFromJson cocktails;
  final int drinkIndex;

  const CocktailCard(
      {Key? key, required this.cocktails, required this.drinkIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => _openCocktailInfo(context),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: NetworkImage(
                        cocktails.drinks[drinkIndex].strDrinkThumb ??
                            Constants.questionImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                cocktails.drinks[drinkIndex].strDrink!,
                textAlign: TextAlign.center,
              ),
              Text(
                cocktails.drinks[drinkIndex].strAlcoholic!,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _openCocktailInfo(BuildContext context) {
    /*
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CocktailInfoScaffold(
        cocktails: cocktails,
        drinkIndex: drinkIndex,
      ),
    ));*/
    Navigator.of(context).pushNamed("/cocktail_info", arguments: {
      "cocktails": cocktails,
      "drinkIndex": drinkIndex,
    });
  }
}
