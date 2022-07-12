import 'package:flutter/material.dart';
import 'package:meals_app/widgets/recipe_item.dart';

import '../dummy_data.dart';

class CategoryRecipesScreen extends StatelessWidget {
  static const routeName = '/category-recipes';
  // const CategoryRecipesScreen(
  //     {Key? key, required this.categoryName, required this.categoryId})
  //     : super(key: key);

  // final String categoryName;
  // final String categoryId;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryName = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryRecipes = DUMMY_MEALS.where((recipe) {
      return recipe.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('$categoryName')),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeItem(
            id: categoryRecipes[index].id,
            title: categoryRecipes[index].title,
            affordability: categoryRecipes[index].affordability,
            complexity: categoryRecipes[index].complexity,
            duration: categoryRecipes[index].duration,
            imageUrl: categoryRecipes[index].imageUrl,
          );
        },
        itemCount: categoryRecipes.length,
      ),
    );
  }
}
