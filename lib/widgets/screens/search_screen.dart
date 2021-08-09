import 'package:flutter/material.dart';
import 'package:reading_memo/widgets/components/search/search_box.dart';
import 'package:reading_memo/widgets/styles/text_style_const.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("見つける", style: TextStyleConst.appBarTitleStyle),
        backgroundColor: Colors.white,
        bottom: SearchBox(),
      ),
      body: Container(
        child: Center(
          child: Text("テスト"),
        ),
      ),
    );
  }
}