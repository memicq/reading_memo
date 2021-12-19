import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/book_addition_bloc.dart';
import 'package:reading_memo/resources/models/views/phrase_addition/book_search_result.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/components/common/book_selection_area/common_book_selection_input_area.dart';
import 'package:reading_memo/widgets/components/common/book_selection_area/common_book_selection_result_list.dart';

class BookAdditionTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BookAdditionBloc _bloc = Provider.of<BookAdditionBloc>(context);

    return Scaffold(
      appBar: BasicAppBar(
        title: "本を追加",
      ),
      body: Container(
        child: Column(
          children: [
            CommonBookSelectionInputArea(
              search: (query) => _bloc.searchBooks(query),
            ),
            Expanded(
              child: StreamBuilder<BookSearchResult>(
                stream: _bloc.bookSearchResultStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Container();

                  BookSearchResult _result = snapshot.data;
                  return CommonBookSelectionResultList(
                    result: _result,
                    selectBook: (item) => _bloc.selectBook(item),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
