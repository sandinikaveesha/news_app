import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newsapi/models/category.dart';

class CategoryListTile extends StatelessWidget {
  CategoryListTile({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(8),
      height: 50,
      width: 110,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: category.color,
      ),
      child: Center(
        child: Text(category.name.toString(),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white
                )),
      ),
    );
  }
}
