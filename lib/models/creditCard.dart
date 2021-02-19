import 'package:flutter/material.dart';

class CreditCard {
  String name;
  int number;
  DateTime expDate;
  int cvc;

  CreditCard(
      {@required this.name,
      @required this.number,
      @required this.expDate,
      @required this.cvc});
}
