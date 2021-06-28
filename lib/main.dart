import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystery_meal/constants/constants.dart';
import 'package:mystery_meal/ui/Provider/theme_provider.dart';
import 'package:mystery_meal/ui/authentication/sign_in.dart';
import 'package:mystery_meal/ui/authentication/recover.dart';
import 'package:mystery_meal/ui/authentication/sign_up.dart';
import 'package:mystery_meal/ui/splashscreen.dart';
import 'package:mystery_meal/ui/home/home.dart';
import 'package:mystery_meal/ui/home/settings.dart';
import 'package:mystery_meal/ui/home/orders.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            ORDERS: (BuildContext context) => Orders(),
          },
          initialRoute: SPLASH_SCREEN,
        );
      },
    );

  var _loginStatus=0;

  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     _loginStatus = preferences.getInt("value");
  //   });
  // }
}



