import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode myTheme = ThemeMode.light;
  String locale = "en";
  static const String keyLocal = "lang";
  static const String isDarkTheme = "theme";
  final SharedPreferences prefsLocale;
  final SharedPreferences prefsTheme;

  MyProvider({required this.prefsLocale, required this.prefsTheme}) {
    readSaveLocale();
    readSaveTheme();
  }

  void readSaveTheme() async {
    var isDark = prefsTheme.getBool(isDarkTheme) ?? false;
    myTheme = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void saveTheme() async {
    prefsTheme.setBool(isDarkTheme, myTheme == ThemeMode.dark);
  }

  changeThemeMode(ThemeMode appTheme) {
    myTheme = appTheme;
    notifyListeners();
    saveTheme();
  }

  void readSaveLocale() async {
    locale = prefsLocale.getString(keyLocal) ?? 'en';
  }

  void saveLocale() async {
    prefsLocale.setString(keyLocal, locale);
  }

  changeLocale(String newLocal, BuildContext context) {
    locale = newLocal;
    context.setLocale(Locale(newLocal));
    notifyListeners();
    saveLocale();
  }
}
