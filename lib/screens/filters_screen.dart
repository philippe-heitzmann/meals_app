import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../dummy_data.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  FiltersScreen(
      {Key? key, required this.setFilters, required this.currentFilters})
      : super(key: key);

  final Function setFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isVegan = false;
  bool isGlutenFree = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  initState() {
    isGlutenFree = widget.currentFilters['gluten']!;
    isLactoseFree = widget.currentFilters['lactose']!;
    isVegetarian = widget.currentFilters['vegetarian']!;
    isVegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget builderSwitchTile(
      String title, String subtitle, var boolvar, Function updateBoolVar) {
    return SwitchListTile(
      value: boolvar,
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(subtitle),
      onChanged: (newValue) => updateBoolVar(newValue),
    );
  }

  // void

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final filterData = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian,
              };
              widget.setFilters(filterData);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          Expanded(
            child: ListView(children: [
              builderSwitchTile(
                'Gluten-free',
                'Only include gluten free meals',
                isGlutenFree,
                (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                },
              ),
              builderSwitchTile('Vegan', 'Only include vegan meals', isVegan,
                  (newValue) {
                setState(() {
                  isVegan = newValue;
                });
              }),
              builderSwitchTile('Lactose free',
                  'Only include lactose free meals', isLactoseFree, (newValue) {
                setState(() {
                  isLactoseFree = newValue;
                });
              }),
              builderSwitchTile(
                  'Vegetarian', 'Only include vegetarian meals', isVegetarian,
                  (newValue) {
                setState(() {
                  isVegetarian = newValue;
                });
              }),
            ]),
          ),
        ],
      ),
    );
  }
}
