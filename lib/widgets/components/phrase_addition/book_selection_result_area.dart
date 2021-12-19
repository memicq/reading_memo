import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/resources/models/views/phrase_addition/book_search_result.dart';
import 'package:reading_memo/widgets/components/common/book_selection_area/common_book_selection_result_list.dart';

class BookSelectionResultArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PhraseAdditionBloc>(context);

    return StreamBuilder(
      stream: _bloc.bookSearchResultStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        BookSearchResult _result = snapshot.data;
        return CommonBookSelectionResultList(
          result: _result,
          selectBook: (item) => _bloc.selectBookItem(item),
        );
      },
    );
  }
}
