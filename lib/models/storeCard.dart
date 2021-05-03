// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:mystery_meal/models/category.dart';
import 'package:mystery_meal/models/rate.dart';

class StoreCard{
  final String name;
  final List<Category> category;
  final Image image;
  final double rate;
  // final Location location;

  StoreCard(
      this.name,
      this.category,
      this.image,
      // this.location,
      this.rate);

  Image getImage(){
    return this.image;
  }

}