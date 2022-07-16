import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/recipe_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/category_recipes_screen.dart';
import './screens/recipe_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/recipe.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Recipe> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals.where((recipe) {
        if (_filters['gluten']! && !recipe.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !recipe.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !recipe.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !recipe.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
              secondary: Colors.white,
              tertiary: Colors.lightBlue,
            ),
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
        CategoryRecipesScreen.routeName: (ctx) => CategoryRecipesScreen(
              availableMeals: _availableMeals,
            ),
        RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              setFilters: _setFilters,
              currentFilters: _filters,
            )
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
