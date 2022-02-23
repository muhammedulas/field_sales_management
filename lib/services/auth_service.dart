import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  bool loggedIn = false;

  void login() {
    loggedIn = true;
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    notifyListeners();
  }
}
