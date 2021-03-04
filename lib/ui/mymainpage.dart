import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.favorite),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.list_alt_outlined),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.settings),
         )
       ],
     ),
    );
  }
}
