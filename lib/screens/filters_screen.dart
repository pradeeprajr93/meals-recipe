import 'package:flutter/material.dart';
import 'package:meals/models/filters.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final route = '/filters';
  final Filter currentFilters;
  final Function updateFilter;

  FiltersScreen(this.currentFilters, this.updateFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Filter localFilters;

  Widget _createListTile(
    String title,
    String subTitle,
    bool value,
    Function changeHandler,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subTitle),
      onChanged: changeHandler,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    localFilters = Filter(
      isGlutenFree: widget.currentFilters.isGlutenFree,
      isLactoseFree: widget.currentFilters.isLactoseFree,
      isVegan: widget.currentFilters.isVegan,
      isVegetarian: widget.currentFilters.isVegetarian,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.updateFilter(localFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          _createListTile(
            'Glutten free',
            'Only list gluten-free meals',
            localFilters.isGlutenFree,
            (value) {
              setState(() {
                localFilters.isGlutenFree = value;
              });
            },
          ),
          _createListTile(
            'Lactose free',
            'Only list lactose-free meals',
            localFilters.isLactoseFree,
            (value) {
              setState(() {
                localFilters.isLactoseFree = value;
              });
            },
          ),
          _createListTile(
            'Vegan',
            'Only list vegan meals',
            localFilters.isVegan,
            (value) {
              setState(() {
                localFilters.isVegan = value;
              });
            },
          ),
          _createListTile(
            'Vegetarian',
            'Only list vegetarian meals',
            localFilters.isVegetarian,
            (value) {
              setState(() {
                localFilters.isVegetarian = value;
              });
            },
          )
        ],
      ),
    );
  }
}
