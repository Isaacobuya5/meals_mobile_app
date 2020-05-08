import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/categories.dart';
import './screens/meal_categories.dart';
import './screens/meal_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (context) => TabsScreen(),
        '/category-meals': (context) => MealCategories(),
        MealDetail.routeName: (context) => MealDetail()
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



