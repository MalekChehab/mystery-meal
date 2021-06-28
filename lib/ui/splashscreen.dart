import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'Provider/user_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  // AnimationController animationController;
  // Animation<double> animation;

  void navigateUser() async{
    WidgetsFlutterBinding.ensureInitialized();
    final value = await UserSecureStorage.getLogIn();
    Navigator.pushReplacementNamed(context, value == 'true' ? HOME : SIGN_IN);
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigateUser);
  }

  @override
  void initState() {
    super.initState();
  //   // animationController = new AnimationController(
  //   //     vsync: this, duration: new Duration(seconds: 2));
  //   // animation =
  //   // new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
  //   //
  //   // animation.addListener(() => this.setState(() {}));
  //   // animationController.forward();
  //
  //   setState(() {
  //     _visible = !_visible;
  //   });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text("Powered By:"),
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: new Image.asset('assets/images/webzone.png', height: 25.0,fit: BoxFit.scaleDown,)
                )

            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/mystery_meal.png',
                width: 250,height: 250,
                // width: animation.value * 250,
                // height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}