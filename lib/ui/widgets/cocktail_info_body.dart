import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';

class CocktailInfoBody extends StatelessWidget {
  final CocktailFromJson cocktails;
  final int drinkIndex;

  const CocktailInfoBody(
      {Key? key, required this.cocktails, required this.drinkIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Alco text
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(cocktails.drinks[drinkIndex].strAlcoholic!),
          ),
          //  text category
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextLink(
              text: Text(cocktails.drinks[drinkIndex].strCategory!),
            ),
          ),
          //  Ingredients row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text("Ingredients:"),
              ),
              createIngredientGrid(cocktails, drinkIndex),
            ],
          ),
          //  Glass row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("Glass:"),
                ),
                TextLink(
                  text: Text(cocktails.drinks[drinkIndex].strGlass!),
                ),
              ],
            ),
          ),
          //  Recipe row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text("Recipe:"),
              ),
              Expanded(
                  child: Text(cocktails.drinks[drinkIndex].strInstructions!))
            ],
          ),
        ],
      ),
    );
  }

  Widget createIngredientGrid(CocktailFromJson cocktails, int drinkIndex) {
    List<String> ingredients = getIngredientList(cocktails, drinkIndex);

    return Expanded(
      child: GridView.count(
        childAspectRatio: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        crossAxisCount: 3,
        children: List.generate(
          ingredients.length,
          (index) => TextLink(text: Text(ingredients[index])),
        ),
      ),
    );

/*     return Flexible(
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ingredients.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //mainAxisSpacing: 4,
            //crossAxisSpacing: 4,
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) => TextLink(
                text: Text(ingredients[index]),
              )),
    ); */
  }

  List<String> getIngredientList(CocktailFromJson cocktails, int drinkIndex) {
    List<String?> listWithNull = [];

    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient1);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient2);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient3);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient4);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient5);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient6);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient7);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient8);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient9);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient10);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient11);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient12);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient13);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient14);
    listWithNull.add(cocktails.drinks[drinkIndex].strIngredient15);

    List<String> resultWithoutNull = [];
    listWithNull.forEach((element) {
      if (element != null) resultWithoutNull.add(element);
    });
    return resultWithoutNull;
  }
}
