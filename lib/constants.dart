class Constants {
  static const String questionImage =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Question_mark_%28black%29.svg/200px-Question_mark_%28black%29.svg.png";
  static const String cocktailDbImg =
      "https://www.thecocktaildb.com/images/cocktail_left.png";

  static String getIngredientImage(String ingredient) =>
      "https://www.thecocktaildb.com/images/ingredients/" +
      ingredient +
      "-Medium.png";
}
