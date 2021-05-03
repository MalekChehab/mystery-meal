// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:mystery_meal/models/category.dart';

class Store {
  String name;
  List<Category> category;
  // Location location;
  DateTime openingTime;
  DateTime closingTime;
  int phoneNumber;
  String email;
  List<String> typeOfBoxes;
  Image image;

  Store({
    @required this.name,
    @required this.category,
    // @required this.location,
    @required this.openingTime,
    @required this.closingTime,
    @required this.phoneNumber,
    @required this.email,
    @required this.typeOfBoxes,
  });

  
}
