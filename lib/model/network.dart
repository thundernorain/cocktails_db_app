import 'dart:convert';

import 'package:http/http.dart';

import 'cocktail_from_json.dart';

class Network {
  final String _searchUrlHead =
      "https://thecocktaildb.com/api/json/v1/1/search.php?";
  final String _filterUrlHead =
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?";
  final String _lookupUrlHead =
      "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?";
  final String _listUrl =
      "https://www.thecocktaildb.com/api/json/v1/1/list.php?";

  Future<CocktailFromJson> searchByName(String? name) {
    final String url;
    if (name != null)
      url = _searchUrlHead + "s=" + name;
    else
      url = _getUrlRandom();

    return _getFuture(url);
  }

  Future<CocktailFromJson> filterByCategory(String category) =>
      _getFuture(_filterUrlHead + "c=" + category);

  Future<CocktailFromJson> filterByIngredient(String ingredient) =>
      _getFuture(_filterUrlHead + "i=" + ingredient);

  Future<CocktailFromJson> lookupCocktailById(String id) =>
      _getFuture(_lookupUrlHead + "i=" + id);

  Future<CocktailFromJson> getCategoriesList() =>
      _getFuture(_listUrl + "c=list");

  Future<CocktailFromJson> getIngredientsList() =>
      _getFuture(_listUrl + "i=list");

  Future<CocktailFromJson> _getFuture(String url) async {
    final response = await get(Uri.parse(url));
    print("${Uri.encodeFull(url)}");

    if (response.statusCode == 200) {
      return CocktailFromJson.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting data.");
    }
  }

  String _getUrlRandom() {
    return "https://thecocktaildb.com/api/json/v1/1/random.php";
  }
}
