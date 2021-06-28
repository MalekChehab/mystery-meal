import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();
  static const _keyLoggedIn = 'isLoggedIn';
  static const _keyUsername = 'username';
  static const _keyTheme = 'theme';
  static const _keyBirthday = 'birthday';

  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future<String> getUsername() async =>
      await _storage.read(key: _keyUsername);

  static Future setLogIn(String boolean) async =>
      await _storage.write(key: _keyLoggedIn, value: boolean);

  static Future<String> getLogIn() async =>
      await _storage.read(key: _keyLoggedIn);

  static Future setTheme(String isDark) async =>
      await _storage.write(key: _keyTheme, value: isDark);

  static Future<String> getTheme() async =>
      await _storage.read(key: _keyTheme);

  static Future setBirthday(DateTime dateOfBirth) async {
    final birthday = dateOfBirth.toIso8601String();

    await _storage.write(key: _keyBirthday, value: birthday);
  }

}