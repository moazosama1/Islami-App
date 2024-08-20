import 'package:flutter/cupertino.dart';

class BottomNavBar extends BottomNavigationBarItem {
  String name;
  String iconPath;
  Color background;

  BottomNavBar(
      {required this.name, required this.iconPath, required this.background})
      : super(
            icon: ImageIcon(AssetImage(iconPath)),
            backgroundColor: background,
            label: name);
}
