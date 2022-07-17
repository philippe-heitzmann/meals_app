import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key})
      : super(key: key); //, required this.foodCategories

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: FOOD_CATEGORIES.map((foodCategory) {
        return CategoryItem(
            id: foodCategory.id,
            name: foodCategory.name,
            color: foodCategory.color);
      }).toList(),
    );
  }
}
