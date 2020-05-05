import 'package:flutter/material.dart';
import '../model/dummy_data.dart';
import './meal_item.dart';

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

    final mealCategories = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle)
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
             return MealItem(
               title: mealCategories[index].title, 
               imageUrl: mealCategories[index].imageUrl, 
               duration: mealCategories[index].duration, 
               complexity: mealCategories[index].complexity, 
               affordability: mealCategories[index].affordability
               ); 
          },
          itemCount: mealCategories.length,),
    );
  }
}