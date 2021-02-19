import 'package:flutter/material.dart';
import 'package:mystery_meal/models/store.dart';
import 'package:mystery_meal/models/customer.dart';

class Rate {
  Customer customer;
  Store store;
  int rating;

  Rate({
    @required this.store,
    @required this.customer,
    @required this.rating,
  });
}
