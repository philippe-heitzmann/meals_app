import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'recipe_detail_card.dart';
import '../dummy_data.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = '/recipe-details';
  //const RecipeDetailScreen({Key? key}) : super(key: key);

  // RecipeDetailScreen(); //{required this.ingredients, required this.steps}

  // List<String> ingredients;
  // List<String> steps;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final recipeId = routeArgs['id'];

    final Recipe recipe = DUMMY_MEALS.firstWhere((x) => x.id == recipeId);

    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    Widget buildEnclosingContainer(
      ListView listview,
    ) {
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 200,
          width: 300,
          child: listview);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('${recipe.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(recipe.imageUrl),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildEnclosingContainer(
                ListView.builder(
                  itemCount: recipe.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: Text(recipe.ingredients[index]),
                      ),
                      color: Theme.of(context).colorScheme.tertiary,
                    );
                  },
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildEnclosingContainer(
                ListView.builder(
                  itemCount: recipe.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${(index + 1)}'),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            child: Text(recipe.steps[index]),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              ),
              // ListView(
              //   children: recipe.ingredients
              //       .map((ingredient) =>
              //           Text(ingredient, style: TextStyle(color: Colors.black)))
              //       .toList(),
              // )
            ],
          ),
        ));

    // return Text(recipe.title)
    // return ListView.builder(itemBuilder: (ctx, index) {
    //   return Text(recipe[index].title);
    // return RecipeDetails(ingredient: recipe.ingredients, step: steps![index]);
    // },
    // );
    // return ListView(
    //   children: ingredients!
    //       .map((recipe) => RecipeDetails(
    //           key: ValueKey(id),
    //           ingredient: recipe,
    //           deleteTxn: deleteTxn))
    //       .toList(),
    // );
  }
}
