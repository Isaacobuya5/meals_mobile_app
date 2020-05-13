import 'package:flutter/material.dart';

import './model/dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/filters.dart';
import './screens/meal_categories.dart';
import './screens/meal_detail.dart';
import './model/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favouriteMeals = [];

  // method to update filters
  void _selectFilters(Map<String, bool> filtersData) {
      setState(() {
        _filters = filtersData;

        _availableMeals.where((meal) {
          if (_filters['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian'] && !meal.isVegetarian) {
            return false;
          }

          return true;
        }).toList();
      });
  }

  void _toggleFavorite(String mealId) {
    // check if meal already exists in the favourites list
    final existingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    // -1 means not found, 0 or above means found
    // if meal exists, then remove from favourite else add to favourites list
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  // method to check favourite status of a meal
  bool _isFavorite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )
      ),
      // home: Categories(),
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        '/category-meals': (context) => MealCategories(_availableMeals),
        MealDetail.routeName: (context) => MealDetail(_toggleFavorite, _isFavorite),
        Filters.routeName: (context) => Filters(_filters,_selectFilters)
      },
      //onGenerateRoute - useful for providing dynamic navigation
      // onGenerateRoute: (settings) {
      //   print(settings.name);
      //   if (settings.name == '/meal-details') {
      //     return MaterialPageRoute(builder: (context) => MealDetail());
      //   }
      // },

      // onUnknownRoute used to provide a fallback in case a route is not found
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => Categories());
      // },
    );
  }
}



