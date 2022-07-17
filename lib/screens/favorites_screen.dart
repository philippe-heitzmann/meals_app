import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/models/category.dart';

import '../models/recipe.dart';
import '../widgets/recipe_item.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key? key, required this.favoritedMeals}) : super(key: key);

  List<Recipe> favoritedMeals;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _removeItem(String id) {
    setState(() {
      widget.favoritedMeals.removeWhere((recipe) => recipe.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index) {
            return RecipeItem(
                id: widget.favoritedMeals[index].id,
                title: widget.favoritedMeals[index].title,
                affordability: widget.favoritedMeals[index].affordability,
                complexity: widget.favoritedMeals[index].complexity,
                duration: widget.favoritedMeals[index].duration,
                imageUrl: widget.favoritedMeals[index].imageUrl);
          },
          itemCount: widget.favoritedMeals.length),
    );
  }
}
