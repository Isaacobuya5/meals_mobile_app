import 'package:flutter/material.dart';

class MealCategories extends StatelessWidget {

  // final id;
  // final title;
  // MealCategories(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    // we need to extract the route arguement and store in a variable
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle)
        ),
        body: Center(
        child: Container(
           child: Text("Meal categories for this type."),
        ),
      ),
    );
  }
}