import 'dart:html';
import 'package:provider/provider.dart';
import 'package:tw_random/provider_study/common/theme.dart';
import 'package:tw_random/provider_study/models/cart.dart';
import 'package:tw_random/provider_study/models/catalog.dart';
import 'package:tw_random/provider_study/screens/cart.dart';
import 'package:tw_random/provider_study/screens/catalog.dart';
import 'package:tw_random/provider_study/screens/login.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'faction_project_lib/bottom_nav_faction/bottom_navigation_list.dart';


void main() {
  runApp(const MyApp());
}

const double windowWidth = 400;
const double windowHeight = 800;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyLogin(),
          '/catalog': (context) => const MyCatalog(),
          '/cart': (context) => const MyCart(),
        },
      ),
    );
  }
}
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

