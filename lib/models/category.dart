import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Category {
  // const Category({Key? key}) : super(key: key);
  final String id;
  final String name;
  final Color color;

  const Category(
      {required this.id, required this.name, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('Test')],
    );
  }
}
