import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  // void tapHandler() {}

  Widget builderListTile(IconData icons, String text, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icons,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.yellow,
          child: Text('Recipes',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary)),
        ),
        const SizedBox(
          height: 10,
        ),
        builderListTile(Icons.restaurant, 'Recipes', () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        builderListTile(Icons.settings, 'Settings', () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }
}
