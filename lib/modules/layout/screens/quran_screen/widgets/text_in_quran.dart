import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/themes/themes.dart';


class TextStyleInApp extends StatelessWidget {
  String text;

  TextStyleInApp(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
