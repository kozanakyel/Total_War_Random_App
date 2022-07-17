import 'package:flutter/material.dart';
import 'faction_project_lib/bottom_nav_faction/bottom_navigation_list.dart';


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

