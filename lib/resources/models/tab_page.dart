import 'package:flutter/material.dart';

class TabPage {
  String title;
  IconData baseIcon;
  IconData activeIcon;
  Widget screenWidget;

  TabPage({
    @required this.title,
    @required this.baseIcon,
    @required this.activeIcon,
    @required this.screenWidget
  });
}