import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
  String email;
  String password;
  int phoneNumber;

  User({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.password,
    @required this.phoneNumber,
  });
}
