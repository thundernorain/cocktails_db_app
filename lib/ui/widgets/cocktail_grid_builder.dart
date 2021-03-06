import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_card.dart';
import 'package:flutter/material.dart';

class CocktailGridBuilder extends StatelessWidget {
  final AsyncSnapshot<CocktailFromJson> snapshot;

  const CocktailGridBuilder({Key? key, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
/*       width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85, */
      child: Expanded(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            physics: ScrollPhysics(),
            //shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: snapshot.data!.drinks.length,
            itemBuilder: (context, i) => CocktailCard(
              name: snapshot.data!.drinks[i].strDrink!,
              alcohol: snapshot.data!.drinks[i].strAlcoholic!,
              image: snapshot.data!.drinks[i].strDrinkThumb,
            ),
          ),
        ),
      ),
    );
  }
}
