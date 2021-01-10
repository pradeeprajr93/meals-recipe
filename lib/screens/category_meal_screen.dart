import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String id;
  // final String title;
  // CategoryMealsScreen(this.id, this.title);
  final List<Meal> availableMeals;
  static const route = '/category-meals';

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> selectedCategoryMeals;
  bool _isLoaded = false;

  _removeItem(mealId) {
    setState(() {
      selectedCategoryMeals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
    // selectedCategoryMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_isLoaded) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      selectedCategoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _isLoaded = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(selectedCategoryMeals[index]);
        },
        itemCount: selectedCategoryMeals.length,
      ),
    );
  }
}
