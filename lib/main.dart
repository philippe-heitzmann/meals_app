import 'package:flutter/material.dart';
import 'package:meals_app/screens/recipe_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/category_recipes_screen.dart';
import './screens/recipe_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals Application',
      theme: ThemeData().copyWith(
        // primarySwatch: Colors.blue,
        // accentColor: Colors.purple,
        colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.blue,
            tertiary: Colors.lightBlue),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 22),
            color: Colors.pink),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
              bodyMedium: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
              bodySmall: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'),
              headlineLarge:
                  TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
            ),
        // primaryTextTheme: ThemeData.light().textTheme.apply(
        //       fontFamily: 'Raleway',
        //     ),
        // accentTextTheme: ThemeData.light().textTheme.apply(
        //       fontFamily: 'RobotoCondensed',
        //     ),
        errorColor: Colors.orange,
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryRecipesScreen.routeName: (ctx) => CategoryRecipesScreen(),
        RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
