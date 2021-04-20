import 'package:flutter/material.dart';
// import 'package:mystery_meal/ui/Provider/sharedPreferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.teal,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.grey.shade500),
    hintColor: Colors.grey.shade300,
    accentColor: Colors.grey.shade800,
    // cardColor: Colors.yellow,
    appBarTheme: AppBarTheme(
        color: Colors.grey.shade800,
        brightness: Brightness.light,
        // textTheme: TextTheme(headline1: TextStyle(color: Colors.yellow), headline2: TextStyle(color: Colors.yellow))
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.teal,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.grey.shade800),
    hintColor: Colors.grey.shade800,
    appBarTheme: AppBarTheme(color: Colors.teal.shade400, brightness: Brightness.dark),
    // textTheme: TextTheme(headline1: TextStyle(color: Colors.yellow)),
  );
}