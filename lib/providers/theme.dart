import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _useDarkTheme = false;

  ThemeData get currentTheme =>
      _useDarkTheme ? ThemeData.dark() : ThemeData.light();

  bool get useDarkTheme => _useDarkTheme;

  void setDarkTheme(bool value) {
    _useDarkTheme = value;
    notifyListeners();
  }
}
