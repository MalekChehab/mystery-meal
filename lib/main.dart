import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystery_meal/constants/constants.dart';
// import 'package:mystery_meal/ui/Provider/sharedPreferences.dart';
import 'package:mystery_meal/ui/Provider/themeProvider.dart';
import 'package:mystery_meal/ui/authentication/sign_in.dart';
import 'package:mystery_meal/ui/authentication/recover.dart';
import 'package:mystery_meal/ui/authentication/sign_up.dart';
import 'package:mystery_meal/ui/splashscreen.dart';
import 'package:mystery_meal/ui/home/home.dart';
import 'package:mystery_meal/ui/home/settings.dart';
import 'package:mystery_meal/ui/storedetails.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          routes: <String, WidgetBuilder>{
            SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
            SIGN_IN: (BuildContext context) => SignIn(),
            RECOVER: (BuildContext context) => RecoverPassword(),
            SIGN_UP: (BuildContext context) => SignUp(),
            HOME: (BuildContext context) => Home(),
            SETTINGS: (BuildContext context) => Settings(),
            STORE_DETAILS: (BuildContext context) => DetailsScreen(),
          },
          initialRoute: SPLASH_SCREEN,
        );
      },
    );
}



