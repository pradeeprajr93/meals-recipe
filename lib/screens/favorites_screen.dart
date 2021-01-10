import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.length == 0) {
      return Center(
        child: Text('No favorites meals. Try adding one!'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(favoriteMeals[index]);
      },
      itemCount: favoriteMeals.length,
    );
  }
}
