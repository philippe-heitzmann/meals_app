import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/screens/favorites_screen.dart';

import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/recipe.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, required this.favoritedMeals}) : super(key: key);

  final List<Recipe> favoritedMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // @override
  // void initState() {
  //   _favoriteMeals = ;
  // }

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
      {'title': 'Categories', 'screen': CategoriesScreen()},
      {
        'title': 'Favorites',
        'screen': FavoritesScreen(
          favoritedMeals: widget.favoritedMeals,
        )
      }
    ];
  }

  int _currentIndex = 0;

  void selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //     length: 2,
    //     initialIndex: 0,
    //     // animationDuration: Duration(milliseconds: 0),
    //     child:
    return Scaffold(
      appBar: AppBar(
        title: Text((_screens[_currentIndex]['title'] as String)),
        // bottom: const TabBar(
        //   labelColor: Colors.white,
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.category),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(Icons.star),
        //       text: 'Favorites',
        //     ),
        //   ],
        // ),
      ),
      drawer: MainDrawer(),
      body: (_screens[_currentIndex]['screen'] as Widget),
      // body: TabBarView(
      //   children: [
      //     CategoriesScreen(),
      //     FavoritesScreen(),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
    // );
  }
}
