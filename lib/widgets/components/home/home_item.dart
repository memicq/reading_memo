import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/widgets/components/home/home_item_content.dart';
import 'package:reading_memo/widgets/components/home/home_item_header.dart';

class HomeListItem extends StatelessWidget {
  final HomeItem item;
  HomeListItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
              top: const BorderSide(color: Colors.black12, width: 0.25),
              bottom: const BorderSide(color: Colors.black12, width: 0.25))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeItemHeader(item: this.item),
          HomeItemContent(item: this.item),
        ],
      ),
    );
  }
}
