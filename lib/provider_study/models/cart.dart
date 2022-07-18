

import 'package:flutter/material.dart';

import 'catalog.dart';

class CartModel extends ChangeNotifier{

  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
    notifyListeners();
    print('notify for catalog CHANGES in cart: ${catalog.getById(1).name}');
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice => items.fold(0, (total, current) => total + current.price);

  void add(Item item){
    _itemIds.add(item.id);
    notifyListeners();
    print('notify for catalog ADDing in cart with ID: ${item.name}');
  }

  void remove(Item item){
    _itemIds.remove(item.id);
    notifyListeners();
    print('notify for catalog REMOVING in cart with ID: ${item.name}');
  }

}