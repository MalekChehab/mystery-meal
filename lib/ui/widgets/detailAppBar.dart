import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

AppBar detailsAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xffFE4180),

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
