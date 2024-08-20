import 'package:flutter/material.dart';
import 'package:islami/modules/layout/screens/settings_screen/widgets/Bottom_click.dart';
import 'package:islami/modules/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
        ),
        const Image(
            image: AssetImage("assets/images/settings.png"),
            height: 250,
            width: 250),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
          thickness: 4,
          indent: 30,
          endIndent: 30,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        BottomClick(
          text: "theme",
          nameBottomOne: "light",
          nameBottomTwo: "dark",
          firstIcon: Icons.light_mode,
          secondIcon: Icons.dark_mode,
          bottomProviderOne: ThemeMode.light,
          bottomProviderTwo: ThemeMode.dark,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        BottomClick(
          text: "language",
          nameBottomOne: "العربيه",
          nameBottomTwo: "English",
          firstIcon: Icons.language,
          secondIcon: Icons.language,
          bottomProviderOne: "ar",
          bottomProviderTwo: "en",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
