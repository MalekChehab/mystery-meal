import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/signin.dart';
import 'package:mystery_meal/ui/signup.dart';
import 'package:mystery_meal/ui/splashscreen.dart';

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
      title: "Login",
      theme: ThemeData(primaryColor: Colors.red[700]),
      // data: Theme.of(context).copyWith(primaryColor: Colors.redAccent,),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) =>  SplashScreen(),
        SIGN_IN: (BuildContext context) =>  SignInPage(),
        SIGN_UP: (BuildContext context) =>  SignUpScreen(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}



