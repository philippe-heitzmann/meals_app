import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:meals_app/main.dart';
import 'package:meals_app/models/recipe.dart';
import '../screens/recipe_detail_screen.dart';

class RecipeItem extends StatelessWidget {
  // const RecipeItem({Key? key}) : super(key: key);

  RecipeItem({
    required this.id,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
    required this.removeItem,
  });

  final String id;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final int duration;
  final String imageUrl;
  final Function removeItem;

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Medium';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Fancy';
        break;
      default:
        return 'Standard';
    }
  }

  Future _selectRecipe(BuildContext context) {
    return Navigator.of(context)
        .pushNamed(RecipeDetailScreen.routeName, arguments: {'id': id}).then(
            (result) => {
                  if (result != null) {removeItem(result)}
                });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () => _selectRecipe(context),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.all(10),
          elevation: 10,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(imageUrl,
                        height: 250, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                      ),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ) //Image(image: ImageProvider),
          ),
    );
  }
}
