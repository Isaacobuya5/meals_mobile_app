import 'package:flutter/material.dart';
import '../model/dummy_data.dart';
import './meal_item.dart';
import '../model/meal.dart';

class MealCategories extends StatefulWidget {

final List<Meal> availableMeals;

MealCategories(this.availableMeals);

  @override
  _MealCategoriesState createState() => _MealCategoriesState();
}

class _MealCategoriesState extends State<MealCategories> {

  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
     //...
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(!_loadedInitData) {
    // we need to extract the route arguement and store in a variable
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
  }
  }

  void _removeItem(String mealId) {
     setState(() {
       displayedMeals.removeWhere((meal) => meal.id == mealId);
     });
  }
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle)
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
             return MealItem(
               id: displayedMeals[index].id,
               title: displayedMeals[index].title, 
               imageUrl: displayedMeals[index].imageUrl, 
               duration: displayedMeals[index].duration, 
               complexity: displayedMeals[index].complexity, 
               affordability: displayedMeals[index].affordability,
               ); 
          },
          itemCount: displayedMeals.length,),
    );
  }
}