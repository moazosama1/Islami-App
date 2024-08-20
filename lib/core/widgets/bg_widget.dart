import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modules/providers/my_provider.dart';

class BgWidget extends StatelessWidget {
  Widget child;

  BgWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            myProvider.myTheme == ThemeMode.dark
                ? "assets/images/bg-dark.png"
                : "assets/images/BgScreen.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
