import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystery_meal/ui/Provider/user_secure_storage.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  final String key = "theme";
  bool _isDarkTheme;
  bool get isDarkTheme => themeMode==ThemeMode.dark;

  void initState() {
    init();
  }

  Future init() async{
    final isDark = await UserSecureStorage.getTheme() ?? '';
    _isDarkTheme = isDark=="true";
    if(_isDarkTheme)
      themeMode=_isDarkTheme?ThemeMode.dark:ThemeMode.light;
    else
      themeMode = ThemeMode.light;
  }

  ThemeProvider() {
    init();
    _loadFromPrefs();
    if(_isDarkTheme==true)
      themeMode=ThemeMode.dark;
    else
      themeMode = ThemeMode.light;
  }

  _loadFromPrefs() async {
    _isDarkTheme = await UserSecureStorage.getTheme()=="true";
    notifyListeners();
  }

  _saveToPrefs() async {
    print(_isDarkTheme);
    await UserSecureStorage.setTheme(_isDarkTheme.toString());
  }

  void toggleTheme(bool boolean) async{
    _isDarkTheme = boolean;
    themeMode = _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    // print(_isDarkTheme);
    _saveToPrefs();
    print("is it dark: "+ await UserSecureStorage.getTheme());
    notifyListeners();
  }
}

class MyThemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.teal,
    accentColor: Colors.yellowAccent,
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