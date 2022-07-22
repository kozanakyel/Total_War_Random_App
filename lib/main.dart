import 'package:provider/provider.dart';
import 'package:tw_random/provider_study/common/theme.dart';
import 'package:tw_random/provider_study/main_provider.dart';
import 'package:tw_random/provider_study/models/cart.dart';
import 'package:tw_random/provider_study/models/catalog.dart';
import 'package:tw_random/provider_study/screens/cart.dart';
import 'package:tw_random/provider_study/screens/catalog.dart';
import 'package:tw_random/provider_study/screens/login.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'faction_project_lib/bottom_nav_faction/bottom_navigation_list.dart';
import 'faction_project_lib/main_twrandom.dart';


void main() {
  runApp(const MyApp());
}

const double windowWidth = 400;
const double windowHeight = 800;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyMultiProvider();
  }
}

//return TwRandomAppMain();

//return MyMultiProvider();





