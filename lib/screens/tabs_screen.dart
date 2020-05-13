import 'package:flutter/material.dart';

import '../model/meal.dart';
import './main_drawer.dart';
import './categories.dart';
import './favourites.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
    {'page': Categories(), 'title': 'Categories'},
    {'page': Favourites(widget.favouriteMeals), 'title': 'Favourites'}
  ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedIndex]['title']),
            ),
        drawer: MainDrawer(),
        body: _pages[_selectedIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category
              ),
              title: Text('categories')
              ),
                        BottomNavigationBarItem(
              icon: Icon(
                Icons.star
              ),
              title: Text('favourites')
              )
          ],
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          unselectedItemColor: Theme.of(context).accentColor,
          ),
      );
  }
}