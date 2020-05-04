import 'package:flutter/material.dart';

import '../model/dummy_data.dart';
import './category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DeliMeal Categories",
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(15.0),
        children: DUMMY_CATEGORIES.map((categoryData) => CategoryItem(categoryData.id,categoryData.title, categoryData.color))
        .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
          )),
    );
  }
}