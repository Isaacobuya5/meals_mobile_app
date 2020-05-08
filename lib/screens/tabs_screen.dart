import 'package:flutter/material.dart';

import './categories.dart';
import './favourites.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    Categories(),
    Favourites()
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
          title: Text('Meals'),
            ),
        body: _pages[_selectedIndex],
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