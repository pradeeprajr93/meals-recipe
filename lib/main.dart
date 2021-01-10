import 'package:flutter/material.dart';
import 'package:meals/models/filters.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category_meal_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/widgets/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var filters = Filter(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  );

  var availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  toggleFavoriteMeals(String mealId) {
    print(mealId);
    var index = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      favoriteMeals.removeAt(index);
    } else {
      favoriteMeals.add(availableMeals.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool isFavoriteMeal(mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  updateFilter(Filter currentFilters) {
    setState(() {
      this.filters = currentFilters;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (currentFilters.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (currentFilters.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (currentFilters.isVegan && !meal.isVegan) {
          return false;
        }
        if (currentFilters.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen(favoriteMeals),
      routes: {
        CategoryMealsScreen.route: (ctx) => CategoryMealsScreen(availableMeals),
        MealDetailsScreen.route: (ctx) =>
            MealDetailsScreen(toggleFavoriteMeals, isFavoriteMeal),
        FiltersScreen.route: (ctx) => FiltersScreen(filters, updateFilter)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen(favoriteMeals));
      },
    );
  }
}
