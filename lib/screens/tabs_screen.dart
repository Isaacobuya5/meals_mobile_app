import 'package:flutter/material.dart';

import './main_drawer.dart';
import './categories.dart';
import './favourites.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': Categories(), 'title': 'Categories'},
    {'page': Favourites(), 'title': 'Favourites'}
  ];

  int _selectedIndex = 0;

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