import 'package:flutter/material.dart';
import 'package:mystery_meal/models/box.dart';
import 'package:mystery_meal/models/store.dart';
import 'package:mystery_meal/models/customer.dart';
class Order{
  int orderNumber;
  double totalPrice;
  Store orderSender;
  Customer orderReceiver;
  DateTime estimatedTime;
  List<Box> boxes;

  Order({
    @required this.orderNumber,
    @required this.totalPrice,
    @required this.orderReceiver,
    @required this.orderSender,
    @required this.estimatedTime,
    @required this.boxes,
});

}