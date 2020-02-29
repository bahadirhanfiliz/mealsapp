import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_screen.dart';

class CategoryGridElement extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryGridElement({this.id, this.title, this.color});

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return MealsScreen(
    //         categoryId: id,
    //         categoryTitle: title,
    //       );
    //     },
    //   ),
    // );

    Navigator.of(context).pushNamed(
      MealsScreen.routeName,
      arguments: {
        'id': id,
        'categoryTitle': title
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
