import 'package:flutter/material.dart';
// import './meal_categories.dart';

class CategoryItem extends StatelessWidget {
  
  final id;
  final title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
   
   void selectedCategory(BuildContext context) {
    //  Navigator.of(context).push(MaterialPageRoute(
    //    builder: (_) {
    //      return MealCategories(id, title);
    //    } ));
         Navigator.of(context).pushNamed('/category-meals',
         arguments: {
           'id': id,
           'title': title
         });
   }
   
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15.0),
        onTap: () => selectedCategory(context),
        child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(title,
        style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color.withOpacity(0.7), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
  }
}