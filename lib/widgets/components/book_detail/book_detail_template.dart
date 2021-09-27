import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

class BookDetailTemplate extends StatelessWidget {
  final BookRow book;

  BookDetailTemplate({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: book.bookTitle,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(book.bookTitle),
            Text(book.authors.join(',')),
          ],
        ),
      ),
    );
  }
}
