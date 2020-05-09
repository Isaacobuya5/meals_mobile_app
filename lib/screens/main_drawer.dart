import 'package:flutter/material.dart';
import './filters.dart';

class MainDrawer extends StatelessWidget {

  _buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
            leading: Icon(icon, size: 26),
            title: Text(title, style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
            onTap: tabHandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up!", 
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
              fontSize: 30
              )),
          ),
          SizedBox(height: 20),
          _buildListTile(
            'Meals', 
            Icons.restaurant,
            () => Navigator.of(context).pushNamed('/')
            ),
          _buildListTile(
            'Filters', 
            Icons.settings,
            () => Navigator.of(context).pushNamed(Filters.routeName)
            )
      ],)
    );
  }
}