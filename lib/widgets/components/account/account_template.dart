import 'package:flutter/material.dart';
import 'package:reading_memo/styles/text_style_const.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

class AccountTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "アカウント"),
      body: Container(
        child: Center(
          child: Text("アカウント"),
        ),
      ),
    );
  }
}