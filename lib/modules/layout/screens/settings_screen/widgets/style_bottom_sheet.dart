import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../providers/my_provider.dart';

class StyleBottomSheet extends StatelessWidget {
  String bottomOne;
  String bottomTwo;
  IconData firstIcon;
  IconData secondIcon;
  dynamic actionBottomOne;
  dynamic actionBottomTwo;

  StyleBottomSheet(
      {required this.bottomOne,
      required this.bottomTwo,
      required this.firstIcon,
      required this.secondIcon,
      required this.actionBottomOne,
      required this.actionBottomTwo});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(50))),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: 4,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ToggleSwitch(
              minWidth: MediaQuery.of(context).size.width * 0.35,
              minHeight: MediaQuery.of(context).size.height * 0.1,
              initialLabelIndex: 0,
              cornerRadius: 30.0,
              radiusStyle: true,
              activeFgColor: Theme.of(context).colorScheme.secondary,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: [bottomOne.tr(), bottomTwo.tr()],
              icons: [firstIcon, secondIcon],
              iconSize: 20,
              fontSize: 20,
              activeBgColor: [Theme.of(context).colorScheme.primary],
              changeOnTap: true,
              onToggle: (index) {
                if (index == 0) {
                  if (actionBottomTwo is ThemeMode) {
                    pro.changeThemeMode(ThemeMode.light);
                    Navigator.pop(context);
                  } else {
                    pro.changeLocale("ar", context);
                    Navigator.pop(context);
                  }
                } else {
                  if (actionBottomTwo is ThemeMode) {
                    pro.changeThemeMode(ThemeMode.dark);
                    Navigator.pop(context);
                  } else {
                    pro.changeLocale("en", context);
                    Navigator.pop(context);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
