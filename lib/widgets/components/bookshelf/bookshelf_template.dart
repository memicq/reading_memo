import 'package:flutter/material.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

class BookshelfTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "本棚"),
      body: Container(
        child: Center(
          child: Text("bookshelf"),
        ),
      ),
    );
  }
}