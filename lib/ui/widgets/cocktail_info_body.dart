import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/model/screen_args.dart';
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
            child: InkWell(
              child: TextLink(
                text: Text(cocktails.drinks[drinkIndex].strCategory!),
              ),
              onTap: () => _onCategoryTap(
                  context, cocktails.drinks[drinkIndex].strCategory!),
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
              createIngredientGrid(context, cocktails, drinkIndex),
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
                InkWell(
                  child: TextLink(
                    text: Text(cocktails.drinks[drinkIndex].strGlass!),
                  ),
                  onTap: () => _onGlassTap(
                      context, cocktails.drinks[drinkIndex].strGlass!),
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

  Widget createIngredientGrid(
      BuildContext context, CocktailFromJson cocktails, int drinkIndex) {
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
          (index) => InkWell(
            child: TextLink(
                text: Text(
              ingredients[index],
            )),
            onTap: () => _onIngredientsTap(context, ingredients[index]),
          ),
        ),
      ),
    );
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

  _onIngredientsTap(BuildContext context, String ingredient) =>
      Navigator.of(context).pushNamed("/filter_cocktails",
          arguments: ScreenArgs(() => _getFutureIngredients(ingredient)));

  Future<CocktailFromJson> _getFutureIngredients(String ingredient) =>
      Network().filterByIngredient(ingredient);

  _onGlassTap(BuildContext context, String glass) =>
      Navigator.of(context).pushNamed("/filter_cocktails",
          arguments: ScreenArgs(() => _getFutureGlass(glass)));

  Future<CocktailFromJson> _getFutureGlass(String glass) =>
      Network().filterByGlass(glass);

  _onCategoryTap(BuildContext context, String category) =>
      Navigator.of(context).pushNamed("/filter_cocktails",
          arguments: ScreenArgs(() => _getFutureCategory(category)));

  Future<CocktailFromJson> _getFutureCategory(String category) =>
      Network().filterByCategory(category);
}
