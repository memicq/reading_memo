import 'package:flutter/material.dart';

import 'book_list_item.dart';

class BookListView extends StatelessWidget {
  final List<BookListItem> gridItems;

  BookListView({@required this.gridItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(children: gridItems),
    );
  }
}
