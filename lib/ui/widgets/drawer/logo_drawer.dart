import 'package:cocktails_db_app/constants.dart';
import 'package:flutter/material.dart';

class LogoInDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(Constants.cocktailDbImg),
            width: 75,
            height: 75,
          ),
          Text(
            "CocktailDB",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
