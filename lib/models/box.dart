import 'package:flutter/material.dart';
import 'package:mystery_meal/models/item.dart';

class Box{
  String type;
  String category;
  int numberOfItems;
  double totalPrice;
  List<Item> items;

  Box({
    @ required this.type,
    @ required this.category,
    @ required this.numberOfItems,
    @ required this.totalPrice,
    @ required this.items,
});
}