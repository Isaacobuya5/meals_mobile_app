import 'package:flutter/material.dart';
import '../model/meal.dart';
import './meal_item.dart';

class Favourites extends StatelessWidget {

  final List<Meal> favouriteMeal;

  Favourites(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
       return Center(
      child: Text("You have no favourite meal yet")
    );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
             return MealItem(
               id: favouriteMeal[index].id,
               title: favouriteMeal[index].title, 
               imageUrl: favouriteMeal[index].imageUrl, 
               duration: favouriteMeal[index].duration, 
               complexity: favouriteMeal[index].complexity, 
               affordability: favouriteMeal[index].affordability
               ); 
          },
          itemCount: favouriteMeal.length,);
    }
   
  }
}