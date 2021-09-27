import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/bookshelf_bloc.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/widgets/components/bookshelf/book_grid_item.dart';
import 'package:reading_memo/widgets/components/bookshelf/book_grid_view.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/components/common/floated_button.dart';
import 'package:reading_memo/widgets/screens/book_addition_screen.dart';

class BookshelfTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BookshelfBloc _bloc = Provider.of<BookshelfBloc>(context);
    return Scaffold(
      appBar: BasicAppBar(title: "本棚"),
      body: StreamBuilder<List<BookRow>>(
        stream: _bloc.booksStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          List<BookRow> books = snapshot.data;
          List<BookGridItem> gridItems =
              books.map((book) => BookGridItem(book: book)).toList();
          return Stack(
            children: [
              BookGridView(gridItems: gridItems),
              Positioned(
                right: 15,
                bottom: 15,
                child: FloatedButton(
                  icon: Icon(Icons.post_add),
                  onPressed: () =>
                      BookAdditionScreen.open(context, callback: () {}),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
