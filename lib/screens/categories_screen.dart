import 'package:flutter/material.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/widgets/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(catData.id, catData.title, catData.color);
      }).toList(),
    );
  }
}
