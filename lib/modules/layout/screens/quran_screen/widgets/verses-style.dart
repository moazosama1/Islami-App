import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VersesStyle extends StatelessWidget {
  String content;
  int index;

  VersesStyle({required this.content, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      text: TextSpan(
        style: DefaultTextStyle
            .of(context)
            .style,
        children: <TextSpan>[
          TextSpan(text: content, style: Theme
              .of(context)
              .textTheme
              .bodySmall),
          TextSpan(
              text: "${index + 1}",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Aya",
                  color: Theme
                      .of(context)
                      .colorScheme
                      .secondary
              )),
        ],
      ),
    );
  }

}
