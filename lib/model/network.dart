import 'dart:convert';

import 'package:http/http.dart';

import 'cocktail_from_json.dart';

class Network {
  final String _searchUrlHead =
      "https://thecocktaildb.com/api/json/v1/1/search.php?";
  final String _lookupUrlHead =
      "https://thecocktaildb.com/api/json/v1/1/lookup.php?";

  Future<CocktailFromJson> getCocktails({String? name}) async {
    final String url;
    if (name != null)
      url = _getUrlFromName(name);
    else
      url = _getUrlRandom();

    final response = await get(Uri.parse(url));
    print("${Uri.encodeFull(url)}");

    if (response.statusCode == 200) {
      return CocktailFromJson.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting data.");
    }
  }

  String _getUrlFromName(String name) {
    return _searchUrlHead + "s=" + name;
  }

  String _getUrlRandom() {
    return "https://thecocktaildb.com/api/json/v1/1/random.php";
  }
}
