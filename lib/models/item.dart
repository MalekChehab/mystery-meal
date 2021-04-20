import 'package:flutter/material.dart';

import 'category.dart';

class Item {
  String name;
  double price;
  Category category;

  //image

  Item({
    @required this.name,
    @required this.price,
    @required this.category,
  });
}
