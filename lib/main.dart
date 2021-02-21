import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/signin.dart';
import 'package:mystery_meal/ui/recover.dart';
import 'package:mystery_meal/ui/signup.dart';
import 'package:mystery_meal/ui/ngosignup.dart';
import 'package:mystery_meal/ui/splashscreen.dart';
import 'package:mystery_meal/ui/homepage.dart';
import 'package:mystery_meal/ui/mymainpage.dart';
import 'package:mystery_meal/models/customer.dart';
import 'package:mystery_meal/models/user.dart';
import 'package:mystery_meal/ui/settings.dart';

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
      // title: "Login",
      theme: ThemeData(primaryColor: const Color(0xffFE4180)),
      // data: Theme.of(context).copyWith(primaryColor: Colors.redAccent,),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SIGN_IN: (BuildContext context) => SignInPage(),
        RECOVER: (BuildContext context) => RecoverPasswordScreen(),
        SIGN_UP: (BuildContext context) => SignUpScreen(),
        NGO_SIGN_UP: (BuildContext context) => NGOSignUpScreen(),
        HOME_PAGE: (BuildContext context) => MyHomePage(),
        MAIN_PAGE: (BuildContext context) => MyMainPage(),
        SETTINGS: (BuildContext context) => SettingsTwoPage(),
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}
