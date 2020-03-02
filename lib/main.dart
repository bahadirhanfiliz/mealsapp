import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> mealList = DUMMY_MEALS;

  List<Meal> favoritesList = [];

  void addOrRemoveFavoritesList(Meal candidateMeal) {
    setState(() {
      var index = favoritesList.indexOf(candidateMeal);
      if (index >= 0) {
        favoritesList.removeAt(index);
      } else {
        favoritesList.add(candidateMeal);
      }
    });
  }

  Map<String, bool> filterSelection = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void updateMealList(Map<String, bool> filterSelectionData) {
    setState(() {
      print('Set state action triggered ------------');
      filterSelection = filterSelectionData;

      mealList = DUMMY_MEALS.where((meal) {
        if (filterSelection['gluten'] && !meal.isGlutenFree) return false;
        if (filterSelection['lactose'] && !meal.isLactoseFree) return false;
        if (filterSelection['vegan'] && !meal.isVegan) return false;
        if (filterSelection['vegetarian'] && !meal.isVegetarian)
          return false;
        else
          return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amberAccent,
          canvasColor: Color.fromRGBO(255, 240, 182, 1),
          hoverColor: Color.fromRGBO(168, 230, 207, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),
      home: TabsScreen(
        favoritesList: favoritesList,
        filterConfig: filterSelection,
        updateState: updateMealList,
      ),
      routes: {
        MealsScreen.routeName: (context) => MealsScreen(mealList),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            favoritesList: favoritesList,
            addOrRemoveFavoritesList: addOrRemoveFavoritesList),
        FiltersScreen.routeName: (context) => FiltersScreen(
            filterConfig: filterSelection, updateState: updateMealList),
      },
      // 404 unknown page
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
