import 'package:flutter/material.dart';
// import 'package:mystery_meal/ui/Provider/sharedPreferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

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
    accentColor: Colors.grey.shade800,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.grey.shade600),
    hintColor: Colors.grey.shade300,
    appBarTheme: AppBarTheme(color: Colors.grey.shade800, brightness: Brightness.light,),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.teal,
    accentColor: Colors.blueAccent,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.grey.shade800),
    hintColor: Colors.grey.shade800,
    appBarTheme: AppBarTheme(color: Colors.teal.shade400, brightness: Brightness.dark),
  );
}