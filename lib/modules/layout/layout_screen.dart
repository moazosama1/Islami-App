import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/hadeth_screen/hadeth_screen.dart';
import 'package:islami/modules/layout/screens/quran_screen/quran_screen.dart';
import 'package:islami/modules/layout/screens/radio_screen/radio_screen.dart';
import 'package:islami/modules/layout/screens/sebha_screen/sebha_screen.dart';
import 'package:islami/modules/layout/screens/settings_screen/settings_screen.dart';
import 'package:islami/modules/layout/widgets/bottom_nav_bar.dart';

import '../../core/widgets/bg_widget.dart';

class LayoutScreen extends StatefulWidget {
  static const routeName = "LayoutScreen";

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int initialPage = 0;
  final List<String> titleKeys = [
    "appTitle",
    "hadeth_tab",
    "sebha_tab",
    "radio_tab",
    "settings_tab",
  ];
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            titleKeys[initialPage].tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            pageController.animateToPage(value,
                duration: const Duration(milliseconds: 600),
                curve: Curves.ease);
            setState(() {
              initialPage = value;
            });
          },
          items: [
            BottomNavBar(
                iconPath: "assets/icons/moshaf_gold.png",
                background: Theme.of(context).primaryColor,
                name: "appTitle".tr()),
            BottomNavBar(
                iconPath: "assets/icons/quran-quran-svgrepo-com.png",
                background: Theme.of(context).primaryColor,
                name: "hadeth_tab".tr()),
            BottomNavBar(
                iconPath: "assets/icons/sebha.png",
                background: Theme.of(context).primaryColor,
                name: "sebha_tab".tr()),
            BottomNavBar(
                iconPath: "assets/icons/radio.png",
                background: Theme.of(context).primaryColor,
                name: "radio_tab".tr()),
            BottomNavBar(
                iconPath: "assets/icons/settings.png",
                background: Theme.of(context).primaryColor,
                name: "settings_tab".tr()),
          ],
          currentIndex: initialPage,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          children: [
            QuranScreen(),
            HadethScreen(),
            const SebhaScreen(),
            const RadioScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
