import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  bool loggedIn = false;
  bool darkMode = false;

  void login() {
    loggedIn = true;
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    notifyListeners();
  }

  void setTheme() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
