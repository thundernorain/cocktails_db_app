import 'package:flutter/material.dart';

import './favorites_card.dart';

class FavoritesGrid extends StatelessWidget {
  final List favoritesList;

  const FavoritesGrid({Key? key, required this.favoritesList})
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
              childAspectRatio: 0.8,
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: favoritesList.length,
            itemBuilder: (context, index) =>
                FavoritesCard(id: favoritesList[index]),
          ),
        ),
      ),
    );
  }
}
