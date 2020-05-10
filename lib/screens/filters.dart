import 'package:flutter/material.dart';
import './main_drawer.dart';

class Filters extends StatefulWidget {

  static const routeName = '/filters';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue) {
    return SwitchListTile(
                      title: Text(title),
                      subtitle: Text(description),
                      value: currentValue,
                      onChanged: updateValue,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters')
      ),
      drawer: MainDrawer(),
        body: Column(
          children: <Widget> [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text("Adjust your meal selection here",
              style: Theme.of(context).textTheme.title,)
              ,),
              Expanded(
                child: ListView(
                  children: <Widget> [
                    _buildSwitchListTile("Gluten-free", "Only include gluten free meals", _glutenFree, (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                    _buildSwitchListTile("Lactose-free", "Only include lactose free meals", _lactoseFree, (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                    _buildSwitchListTile("Vegetarian", "Only include vegetarian meals", _vegetarian, (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                    _buildSwitchListTile("Vegan", "Only include vegan meals", _vegan, (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    })
                  ]
                )
                )
          ]
        ),
    );
  }
}