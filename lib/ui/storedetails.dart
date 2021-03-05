import 'package:flutter/material.dart';
// import 'package:food_app/constants.dart';
import 'package:mystery_meal/ui/widgets/detailAppBar.dart';
import 'package:mystery_meal/ui/widgets/detailsBody.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: detailsAppBar(),
      body: Body(),
    );
  }
}