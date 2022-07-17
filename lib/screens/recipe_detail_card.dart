import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  // const RecipeDetails({Key? key}) : super(key: key);

  RecipeDetails({Key? key, required this.ingredient, required this.step})
      : super(key: key);

  final String ingredient;
  final String step;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [Text('1')],
    ));
  }
}
