import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final Function updateState;
  final Map<String, bool> filterConfig;
  final List<Meal> favoritesList;

  TabsScreen(
      {this.filterConfig, this.updateState, @required this.favoritesList});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;

  @override
  void initState() {
    pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(
          favoritesList: widget.favoritesList,
        ),
        'title': 'Favorites'
      },
    ];
    super.initState();
  }

  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(
          filterConfig: widget.filterConfig, updateState: widget.updateState),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ]),
    );
  }
}
