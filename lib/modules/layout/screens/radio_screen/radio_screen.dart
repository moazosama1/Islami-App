import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(image: AssetImage("assets/images/radio.png")),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Text(
          "redio_holy".tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageIcon(const AssetImage("assets/icons/metro-next.png"),
                color: Theme.of(context).colorScheme.secondary),
            ImageIcon(const AssetImage("assets/icons/awesome-play.png"),
                color: Theme.of(context).colorScheme.secondary),
            ImageIcon(const AssetImage("assets/icons/metro-next2.png"),
                color: Theme.of(context).colorScheme.secondary),
          ],
        ),
      ],
    );
  }
}
