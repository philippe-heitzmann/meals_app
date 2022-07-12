import 'package:flutter/material.dart';

import '../screens/category_recipes_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String name;
  final Color color;

  const CategoryItem(
      {required this.id,
      required this.name,
      required this.color}); //: super(key: key);

  Future _selectCategory(BuildContext ctx) {
    return Navigator.of(ctx)
        .pushNamed('/category-recipes', arguments: {'id': id, 'title': name});
    // return Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryRecipesScreen(
    //         categoryId: id,
    //         categoryName: name,
    //       );
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(name, style: Theme.of(context).textTheme.bodyLarge),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
