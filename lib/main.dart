import 'package:flutter/material.dart';
import 'package:islami/core/themes/themes.dart';
import 'package:islami/modules/layout/layout_screen.dart';
import 'package:islami/modules/layout/screens/hadeth_screen/widgets/hadeth_details.dart';
import 'package:islami/modules/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/layout/screens/quran_screen/widgets/sura_details.dart';
import 'package:easy_localization/easy_localization.dart';

import 'modules/providers/my_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  var sharedPrefTheme = await SharedPreferences.getInstance();
  var sharedPrefLocale = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
    create: (context) =>
        MyProvider(prefsLocale: sharedPrefLocale, prefsTheme: sharedPrefTheme),
    builder: (context, child) {
      var provider = Provider.of<MyProvider>(context);
      return EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        startLocale: Locale(provider.locale),
        fallbackLocale: Locale(provider.locale),
        saveLocale: true,
        child: const MyApplication(),
      );
    },
  ));
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Islami",
      theme: ThemesApp.lightThemes,
      darkTheme: ThemesApp.darkThemes,
      themeMode: provider.myTheme,
      routes: {
        LayoutScreen.routeName: (_) => LayoutScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
        SplashScreen.routeName: (_) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // Convert string to Locale
    );
  }
}
