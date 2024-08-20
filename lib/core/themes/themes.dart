import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemesApp {
  static const Color lightPrimaryColor = Color(0xffB7935F);
  static const Color lightSecondryColor = Color(0xff242424);
  static const Color darkPrimaryColor = Color(0xff141A2E);
  static const Color darkSecondryColor = Color(0xffFACC1D);
  static const bool isDark = true;
  static const TextStyle styleText = TextStyle(
    fontSize: 25,
    color: lightSecondryColor,
  );
  static ThemeData lightThemes = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts
        .elMessiri()
        .fontFamily,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontSize: 30,
            color: lightSecondryColor,
            fontFamily: GoogleFonts
                .elMessiri()
                .fontFamily,
            fontWeight: FontWeight.w700)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ThemesApp.lightPrimaryColor,
        selectedItemColor: ThemesApp.lightSecondryColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(size: 30),
        selectedLabelStyle:
        TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
    iconTheme: const IconThemeData(color: lightSecondryColor),
    colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimaryColor,
        primary: lightPrimaryColor,
        onPrimary: Colors.white,
        secondary: lightSecondryColor,
        onSecondary: lightPrimaryColor),
    dividerColor: lightPrimaryColor,
    cardTheme: const CardTheme(
      color: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    textTheme: TextTheme(
        titleMedium: TextStyle(
          fontFamily: GoogleFonts
              .elMessiri()
              .fontFamily,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: lightSecondryColor,
        ),
        titleSmall: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 25,
            color: lightSecondryColor),
        titleLarge: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: lightSecondryColor),
        bodyMedium: TextStyle(
          fontFamily: GoogleFonts
              .elMessiri()
              .fontFamily,
          fontSize: 25,
          color: lightSecondryColor,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 25,
          color: lightSecondryColor,
        ),
        bodySmall: const TextStyle(
            color: lightSecondryColor,
            fontSize: 20,
            height: 2,
            fontWeight: FontWeight.w400)),
  );

  static ThemeData darkThemes = ThemeData(
      fontFamily: GoogleFonts
          .elMessiri()
          .fontFamily,
      scaffoldBackgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontFamily: GoogleFonts
                  .elMessiri()
                  .fontFamily,
              fontWeight: FontWeight.w700)),
      cardTheme: const CardTheme(
        color: darkPrimaryColor,
        surfaceTintColor: darkPrimaryColor,
      ),
      dividerColor: darkSecondryColor,
      textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: GoogleFonts
                .elMessiri()
                .fontFamily,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleSmall: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25,
              color: darkSecondryColor),
          titleLarge: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 25, color: Colors.white),
          bodyMedium: TextStyle(
            fontFamily: GoogleFonts
                .elMessiri()
                .fontFamily,
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            color: Colors.white,
          ),
          bodySmall: const TextStyle(
              color: darkSecondryColor,
              fontSize: 20,
              height: 2,
              fontWeight: FontWeight.w400)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: darkPrimaryColor,
          selectedItemColor: darkSecondryColor,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 30),
          selectedLabelStyle:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      colorScheme: ColorScheme.fromSeed(
          seedColor: darkSecondryColor,
          primary: darkPrimaryColor,
          onPrimary: darkPrimaryColor,
          secondary: darkSecondryColor,
          onSecondary: darkSecondryColor));
}
