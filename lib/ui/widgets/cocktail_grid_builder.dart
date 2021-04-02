import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_card.dart';
import 'package:flutter/material.dart';

class CocktailGridBuilder extends StatelessWidget {
  final CocktailFromJson cocktails;
  final Widget Function(BuildContext, int) itemBuilder;

  const CocktailGridBuilder(
      {Key? key, required this.cocktails, required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.builder(
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.72,
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: cocktails.drinks.length,
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }
}
