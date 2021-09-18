import 'package:flutter/material.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

class BookshelfTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: "本棚"),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            AaaCard(),
            AaaCard(),
            AaaCard(),
            AaaCard(),
            AaaCard(),
            AaaCard(),
            AaaCard(),
            AaaCard(),
          ],
        ),
      ),
    );
  }
}

class AaaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Center(child: Text("aaa")),
      ),
    );
  }
}