import 'package:flutter/material.dart';
import './main_drawer.dart';

class Filters extends StatefulWidget {

  static const routeName = '/filters';

  final Function _selectFilters;

  final Map<String, bool> _currentFilters;

  Filters(this._currentFilters,this._selectFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget._currentFilters['gluten'];
    _lactoseFree = widget._currentFilters['lactose'];
    _vegan = widget._currentFilters['vegan'];
    _vegetarian = widget._currentFilters['vegetarian'];
  }

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
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: () {
              final filtersData = {
    "gluten": _glutenFree,
    "lactose": _lactoseFree,
    "vegan": _vegan,
    "vegetarian": _vegetarian
  };
  print(filtersData);
              widget._selectFilters(filtersData);
            })
        ],
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