import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filterConfig;
  final Function updateState;

  FiltersScreen({this.filterConfig, this.updateState});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.filterConfig['gluten'];
    vegetarian = widget.filterConfig['vegetarian'];
    vegan = widget.filterConfig['vegan'];
    lactoseFree = widget.filterConfig['lactose'];
    super.initState();
  }

  Widget buildSwitchListTile({String title, String subtitle, int index}) {
    switch (index) {
      case 0:
        return SwitchListTile(
          title: Text(title),
          value: glutenFree,
          subtitle: Text(subtitle),
          onChanged: (newValue) {
            setState(() {
              glutenFree = newValue;
              widget.filterConfig['gluten'] = newValue;
            });
          },
        );
        break;
      case 1:
        return SwitchListTile(
          title: Text(title),
          value: vegetarian,
          subtitle: Text(subtitle),
          onChanged: (newValue) {
            setState(() {
              vegetarian = newValue;
              widget.filterConfig['vegetarian'] = newValue;
            });
          },
        );
      case 2:
        return SwitchListTile(
          title: Text(title),
          value: vegan,
          subtitle: Text(subtitle),
          onChanged: (newValue) {
            setState(() {
              vegan = newValue;
              widget.filterConfig['vegan'] = newValue;
            });
          },
        );
      case 3:
        return SwitchListTile(
          title: Text(title),
          value: lactoseFree,
          subtitle: Text(subtitle),
          onChanged: (newValue) {
            setState(() {
              lactoseFree = newValue;
              widget.filterConfig['lactose'] = newValue;
            });
          },
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(
        filterConfig: widget.filterConfig,
        updateState: widget.updateState,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                    title: 'Gluten-free',
                    subtitle: 'Filter gluten-free meals',
                    index: 0),
                buildSwitchListTile(
                    title: 'Vegetarian>',
                    subtitle: 'Filter vegetarian meals',
                    index: 1),
                buildSwitchListTile(
                    title: 'Vegan', subtitle: 'Filter vegan meals', index: 2),
                buildSwitchListTile(
                    title: 'Lactose-free',
                    subtitle: 'Filter lactose-free meals',
                    index: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
