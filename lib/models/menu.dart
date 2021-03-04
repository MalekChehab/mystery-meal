import 'package:flutter/material.dart';
import 'package:mystery_meal/models/item.dart';
import 'package:mystery_meal/models/store.dart';

class Menu {
  Store store;
  List<Item> items;

  Menu({
    @required this.items,
    @required this.store,
  });
}
