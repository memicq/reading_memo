import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/resources/models/views/phrase_addition/book_search_result.dart';
import 'package:reading_memo/widgets/components/phrase_addition/book_selection_no_result.dart';

import 'book_selection_result_list_item.dart';

class BookSelectionResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PhraseAdditionBloc>(context);
    return StreamBuilder(
      stream: _bloc.bookSearchResultStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          BookSearchResult _result = snapshot.data;
          if (_result.isSearchedOnce && _result.items.length == 0) {
            return BookSelectionNoResult();
          } else {
            return Scrollbar(
              child: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(bottom: 50),
                    width: double.infinity,
                    child: Column(
                      children: _result.items
                          .map((item) => BookSelectionResultListItem(item: item))
                          .toList(),
                    )),
              ),
            );
          }
        }
    );
  }
}
