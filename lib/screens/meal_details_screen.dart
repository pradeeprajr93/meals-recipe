import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/dummy_data.dart';

class MealDetailsScreen extends StatefulWidget {
  static const route = "/meal-details";
  final Function toggleFavoriteMeals;
  final Function isFavoriteMeal;

  MealDetailsScreen(this.toggleFavoriteMeals, this.isFavoriteMeal);

  @override
  _MealDetailsScreenState createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  Meal getMealDetails(String mealId) {
    return DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
  }

  Widget titleContainer(BuildContext context, String heading) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget boxContainerforList(list) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mealID = ModalRoute.of(context).settings.arguments as String;
    final Meal mealDetails = getMealDetails(mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: widget.isFavoriteMeal(mealID)
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
        onPressed: () {
          setState(() {
            widget.toggleFavoriteMeals(mealID);
          });
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.network(
                mealDetails.imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
              titleContainer(context, 'Ingredients'),
              boxContainerforList(ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(mealDetails.ingredients[index]),
                    ),
                  );
                },
                itemCount: mealDetails.ingredients.length,
              )),
              titleContainer(context, 'Steps'),
              boxContainerforList(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(mealDetails.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: mealDetails.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
