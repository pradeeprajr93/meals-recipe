import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerMenu(
    BuildContext context,
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 120,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
          ),
          buildDrawerMenu(context, 'Meals', Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed('/')),
          buildDrawerMenu(
              context,
              'Filters',
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.route)),
        ],
      ),
    );
  }
}
