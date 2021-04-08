import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/authentication/signin.dart';
import 'package:mystery_meal/ui/authentication/recover.dart';
import 'package:mystery_meal/ui/authentication/signup.dart';
import 'package:mystery_meal/ui/splashscreen.dart';
import 'package:mystery_meal/ui/home/home.dart';
import 'package:mystery_meal/ui/home/settings.dart';
import 'package:mystery_meal/ui/storedetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primaryColor: const Color(0xffFE4180)),
      // title: "Login",
      //theme: ThemeData(primaryColor: const Color(0xffFE4180)),
      theme: ThemeData(
          primaryColor: PrimaryColor,
          accentColor: SecondaryColor),
      // data: Theme.of(context).copyWith(primaryColor: Colors.redAccent,),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) =>  SplashScreen(),
        SIGN_IN: (BuildContext context) =>  SignIn(),
        RECOVER: (BuildContext context) =>  RecoverPassword(),
        SIGN_UP: (BuildContext context) =>  SignUp(),
        HOME: (BuildContext context) => Home(),
        SETTINGS: (BuildContext context) => Settings(),
        STORE_DETAILS:(BuildContext context)=>DetailsScreen(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}



