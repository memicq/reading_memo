import 'package:flutter/material.dart';

import 'book_grid_item.dart';

class BookGridView extends StatelessWidget {
  final List<BookGridItem> gridItems;

  BookGridView({@required this.gridItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GridView.count(
        padding: EdgeInsets.only(top: 20),
        crossAxisCount: 3,
        children: gridItems,
      ),
    );
  }
}
