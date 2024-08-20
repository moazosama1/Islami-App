import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/settings_screen/widgets/style_bottom_sheet.dart';

typedef ThemeModeCall = ThemeMode Function(ThemeMode themeMode);

class BottomClick extends StatelessWidget {
  String text;
  String nameBottomOne;
  String nameBottomTwo;
  IconData firstIcon;
  IconData secondIcon;
  dynamic bottomProviderOne;
  dynamic bottomProviderTwo; // ThemeModeCall themeModeCall ;
  BottomClick(
      {required this.text,
      required this.nameBottomOne,
      required this.nameBottomTwo,
      required this.firstIcon,
      required this.secondIcon,
      required this.bottomProviderOne,
      required this.bottomProviderTwo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showThemeBottomSheet(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.38,
        height: MediaQuery.of(context).size.height * 0.045,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text.tr(),
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 25),
        ),
      ),
    );
  }

  showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(50))),
      context: context,
      builder: (context) {
        return StyleBottomSheet(
          bottomOne: nameBottomOne,
          bottomTwo: nameBottomTwo,
          firstIcon: firstIcon,
          secondIcon: secondIcon,
          actionBottomOne: bottomProviderOne,
          actionBottomTwo: bottomProviderTwo,
        );
      },
    );
  }
}
