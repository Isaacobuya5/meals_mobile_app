import 'package:flutter/material.dart';

class MealCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meal Category")
        ),
        body: Center(
        child: Container(
           child: Text("Meal categories for this type."),
        ),
      ),
    );
  }
}