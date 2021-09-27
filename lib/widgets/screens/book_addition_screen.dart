import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/book_addition_bloc.dart';
import 'package:reading_memo/widgets/components/book_addition/book_addition_template.dart';

class BookAdditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<BookAdditionBloc>(
      create: (context) => BookAdditionBloc(),
      child: BookAdditionTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }

  static void open(
    BuildContext context, {
    @required void Function() callback,
  }) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => BookAdditionScreen(),
            fullscreenDialog: true,
          ),
        )
        .then(
          (value) => callback(),
        );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
