import 'package:flutter/material.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

class PhraseDetailTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "詳細",),
      body: Container(
        child: Text(''),
      ),
    );
  }
}