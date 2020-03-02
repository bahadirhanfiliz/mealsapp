import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_element.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesList;

  FavoritesScreen({@required this.favoritesList});

  @override
  Widget build(BuildContext context) {
    return favoritesList.isEmpty
        ? Center(
            child: Text('No Favorite Meals Are Selected Yet!'),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealElement(favoritesList[index]);
            },
            itemCount: favoritesList.length,
          );
  }
}
