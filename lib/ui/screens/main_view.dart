import 'package:cocktails_db_app/model/cocktail_from_json.dart';
import 'package:cocktails_db_app/model/network.dart';
import 'package:cocktails_db_app/ui/widgets/cocktail_grid_builder.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  Future<CocktailFromJson>? cocktails;
  String? _cocktailName;

  @override
  void initState() {
    super.initState();
    cocktails = Network().getCocktails(name: _cocktailName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8),
            child: _searchBar(),
          ),
          Container(
            child: FutureBuilder(
              future: cocktails,
              builder: (context, AsyncSnapshot<CocktailFromJson> snapshot) =>
                  snapshot.hasData
                      ? CocktailGridBuilder(cocktails: snapshot.data!)
                      : _snapshotWithoutData(snapshot),
            ),
          )
        ],
      ),
    );
  }

  Widget _searchBar() => TextField(
        decoration: InputDecoration(
          hintText: "Enter cocktail name",
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onSubmitted: (value) {
          setState(() {
            _cocktailName = value;
            cocktails = Network().getCocktails(name: _cocktailName);
          });
        },
      );

  Widget _snapshotWithoutData(AsyncSnapshot<CocktailFromJson> snapshot) =>
      snapshot.hasError
          ? Center(
              child: Text("Error getting data"),
            )
          : Center(
              child: CircularProgressIndicator(),
            );
}
