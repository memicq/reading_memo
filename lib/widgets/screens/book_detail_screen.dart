import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/book_detail_bloc.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/widgets/components/book_detail/book_detail_template.dart';

class BookDetailScreen extends StatelessWidget {
  final BookRow book;

  BookDetailScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Provider<BookDetailBloc>(
      create: (context) => BookDetailBloc(),
      child: BookDetailTemplate(book: book),
      dispose: (context, value) => value.dispose(),
    );
  }

  static void open(BuildContext context, BookRow book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookDetailScreen(book: book),
      ),
    );
  }
}
