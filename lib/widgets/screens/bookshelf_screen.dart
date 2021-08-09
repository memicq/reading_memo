import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/bookshelf_bloc.dart';
import 'package:reading_memo/widgets/components/bookshelf/bookshelf_template.dart';

class BookshelfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<BookshelfBloc>(
      create: (context) => BookshelfBloc(),
      child: BookshelfTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }
}