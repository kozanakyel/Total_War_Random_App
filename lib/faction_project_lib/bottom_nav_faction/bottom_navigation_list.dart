import 'package:flutter/material.dart';

import '../factions_list/list_faction_widget.dart';
import '../random_faction/random_faction_select.dart';

class BottomNavigationList extends StatefulWidget {
  const BottomNavigationList({Key? key}) : super(key: key);

  @override
  State<BottomNavigationList> createState() => _BottomNavigationListState();
}

class _BottomNavigationListState extends State<BottomNavigationList> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    RandomFactionButton(),
    ListFactions(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Attila Total War'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.cyclone_rounded),
              label: 'Random Selector',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_4x4),
              label: 'Factions List',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        )
    );
  }
}


