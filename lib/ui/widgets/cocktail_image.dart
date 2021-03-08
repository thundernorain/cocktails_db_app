import 'package:flutter/material.dart';

import '../../constants.dart';

class CocktailImage extends StatelessWidget {
  final String? imageUrl;

  const CocktailImage({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl ?? Constants.questionImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
