import 'package:flutter/material.dart';

class UserAuth with ChangeNotifier {
  static bool _isLoggedIn = false;

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  void logIn() {
    _isLoggedIn = true;

    notifyListeners();
  }

  void logOut() {
    _isLoggedIn = false;

    notifyListeners();
  }
}
