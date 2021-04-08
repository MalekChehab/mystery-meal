import 'package:flutter/material.dart';
import 'package:mystery_meal/models/store.dart';
import 'package:mystery_meal/models/customer.dart';
class Complaint{
  Customer sender;
  Store receiver;
  String message;

  Complaint({
    @ required this.message,
    @ required this.sender,
    @ required this.receiver,
});

}