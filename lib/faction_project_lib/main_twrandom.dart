import 'package:flutter/material.dart';

import 'bottom_nav_faction/bottom_navigation_list.dart';

class TwRandomAppMain extends StatelessWidget {
  const TwRandomAppMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TW Random Faction App',
      theme: ThemeData.dark(),
      home: const BottomNavigationList(),
    );
  }
}