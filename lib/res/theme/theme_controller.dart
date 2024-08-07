import 'package:dome/res/theme/theme.dart';
import 'package:flutter/material.dart';

enum ThemePallete { light, dark, primary }

class ThemeService extends ChangeNotifier {
  ThemePallete currentThemePallete = ThemePallete.light;

  //modify current theme pallete
  changeThemePallete(ThemePallete pallete) {
    currentThemePallete = pallete;

    notifyListeners();
  }

  //return current theme pallete

  ThemeData returnCurrentThemePallet() {
    // switch (currentThemePallete) {
    //   case ThemePallete.light:
    //     return BThemes.light;
    //   case ThemePallete.dark:
    //     return BThemes.dark;
    // }
    return BThemes.light;
  }
}
