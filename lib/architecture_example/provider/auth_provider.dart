import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthProvider extends ChangeNotifier {
  AuthProvider() {
  }
  bool _loggedIn = false;

  get loggedIn => _loggedIn;


  void setLoggedIn() {
    _loggedIn = true;
    notifyListeners();
  }

  void setLogOut() {
    _loggedIn = false;
    notifyListeners();
  }

}

