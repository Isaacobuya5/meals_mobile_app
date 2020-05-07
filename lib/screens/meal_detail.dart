import 'package:flutter/material.dart';
import '../model/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = "/meal-detail";

  Widget _buildSectionTitle(String title, BuildContext context) {
       return Container(
            margin: EdgeInsets.symmetric(
            vertical: 10.0
            ),
            child: Text(title,
            style: Theme.of(context).textTheme.title),
            );
  }

  Widget _buildContainer(Widget child) {
    return  Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0)
            ),
            height: 150,
            width: 300,
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Details"),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget> [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover
              ),
              ),
            _buildSectionTitle("Ingredients", context),
            _buildContainer(ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  )
                ),
                itemCount: selectedMeal.ingredients.length,
                )
            ),
            _buildSectionTitle("Steps", context),
            _buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(child: 
                    Text("# ${index + 1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
              ))
          ]
        ),
      ),
    );
  }
}