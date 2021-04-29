
import 'package:flutter/material.dart';

class TabPage {
  String title;
  IconData baseIcon;
  IconData activeIcon;
  Widget pageScaffold;

  TabPage({
    this.title,
    this.baseIcon,
    this.activeIcon,
    this.pageScaffold
  });
}