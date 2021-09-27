import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/widgets/screens/book_detail_screen.dart';

class BookGridItem extends StatelessWidget {
  final BookRow book;

  BookGridItem({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          BookDetailScreen.open(context, book);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(book.bookTitle),
          ),
        ),
      ),
    );
  }
}
