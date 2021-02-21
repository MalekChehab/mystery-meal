//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:mystery_meal/models/user.dart';

class Customer extends User{
  int reportCounter;
  int points;
  //Location currentLocation;

  Customer({
    //@ required this.currentLocation,
    this.points,
    this.reportCounter,
  });
}