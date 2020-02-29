import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_element.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = '/meals';

  final List<Meal> mealList;

  MealsScreen(this.mealList);
  // final String categoryId;
  // final String categoryTitle;

  // MealsScreen({
  //   @required this.categoryTitle,
  //   @required this.categoryId,
  // });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['categoryTitle'];
    final categoryId = routeArgs['id'];
    final selectedCategoryMeals = mealList
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealElement(selectedCategoryMeals[index]);
        },
        itemCount: selectedCategoryMeals.length,
      ),
    );
  }
}
