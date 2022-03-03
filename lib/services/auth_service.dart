import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  bool loggedIn = false;
  late ThemeMode theme = ThemeMode.system;

  void login() {
    loggedIn = true;
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    notifyListeners();
  }

  void setTheme() {
    if (theme == ThemeMode.dark) {
      theme = ThemeMode.light;
    } else if (theme == ThemeMode.light) {
      theme = ThemeMode.system;
    } else {
      theme = ThemeMode.dark;
    }
    notifyListeners();
  }
}
