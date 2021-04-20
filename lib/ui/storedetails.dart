import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/widgets/detailAppBar.dart';
import 'package:mystery_meal/ui/widgets/detailsBody.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: detailsAppBar(),
      body: Body(),
    );
  }
}