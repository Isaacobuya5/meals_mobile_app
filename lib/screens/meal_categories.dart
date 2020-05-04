import 'package:flutter/material.dart';

class MealCategories extends StatelessWidget {

  final id;
  final title;
  MealCategories(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title)
        ),
        body: Center(
        child: Container(
           child: Text("Meal categories for this type."),
        ),
      ),
    );
  }
}