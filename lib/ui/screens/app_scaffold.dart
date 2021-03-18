import 'package:cocktails_db_app/ui/screens/favorites_screen.dart';
import 'package:cocktails_db_app/ui/screens/main_view.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final List<Map<String, Object>> _pages = [
    {
      "page": MainView(),
      "title": "Cocktails",
    },
    {
      "page": FavoritesScreen(),
      "title": "Favorites",
    },
  ];

  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPage]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        /* To add selected color */
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Cocktails",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
