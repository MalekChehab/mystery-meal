import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/main.dart';

AppBar detailsAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor:PrimaryColor,

    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {},
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.share),
        onPressed: () {},
      ),
      IconButton(
        icon:Icon(Icons.more_vert),
        onPressed: () {},
      ),
    ],
  );
}
