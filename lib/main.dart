import 'package:flutter/material.dart';
import 'package:tw_random/faction_project_lib/random_faction/random_faction_select.dart';
import 'faction_project_lib/factions_list/list_faction_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const BottomNavigationList(),
    );
  }
}

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
