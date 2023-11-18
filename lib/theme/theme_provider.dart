import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = TAppTheme.lightTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == TAppTheme.lightTheme) {
      themeData = TAppTheme.darkTheme;
    }
    else{
      themeData=TAppTheme.lightTheme;
    }
  }
}
