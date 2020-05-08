import 'package:flutter/material.dart';

import './categories.dart';
import './favourites.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget> [
              Tab(
                icon: Icon(Icons.category), 
                text: 'categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'favourites',
              )
            ]
            ),
            ),
        body: TabBarView(
          children: <Widget> [
             Categories(),
             Favourites(),
          ]
          ),
      )
      );
  }
}