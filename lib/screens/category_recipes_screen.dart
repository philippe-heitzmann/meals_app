import 'package:flutter/material.dart';
import 'package:meals_app/widgets/recipe_item.dart';

import '../models/recipe.dart';
import '../dummy_data.dart';

class CategoryRecipesScreen extends StatefulWidget {
  static const routeName = '/category-recipes';

  CategoryRecipesScreen({required this.availableMeals});

  List<Recipe> availableMeals;

  @override
  State<CategoryRecipesScreen> createState() => _CategoryRecipesScreenState();
}

class _CategoryRecipesScreenState extends State<CategoryRecipesScreen> {
  String? categoryName;
  String? categoryId;
  List<Recipe>? categoryRecipes;
  var _loadInitData = false;

  @override
  void initState() {
    //implement
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryName = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryRecipes = widget.availableMeals.where((recipe) {
        return recipe.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
      super.didChangeDependencies();
    }
  }

  void _removeItem(String id) {
    setState(() {
      categoryRecipes!.removeWhere((recipe) => recipe.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$categoryName')),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return RecipeItem(
            id: categoryRecipes![index].id,
            title: categoryRecipes![index].title,
            affordability: categoryRecipes![index].affordability,
            complexity: categoryRecipes![index].complexity,
            duration: categoryRecipes![index].duration,
            imageUrl: categoryRecipes![index].imageUrl,
          );
        },
        itemCount: categoryRecipes!.length,
      ),
    );
  }
}
