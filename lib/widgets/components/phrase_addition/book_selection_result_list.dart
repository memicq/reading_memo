import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/resources/models/book_selection_item.dart';
import 'package:reading_memo/resources/models/phrase_addition_view.dart';
import 'package:reading_memo/widgets/components/phrase_addition/book_selection_no_result.dart';

import 'book_selection_result_list_item.dart';

class BookSelectionResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PhraseAdditionBloc>(context);

    return Scrollbar(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: 50),
        width: double.infinity,
        child: StreamBuilder(
            stream: _bloc.bookSearchResultStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                PhraseAdditionView view = snapshot.data;
                if (view.bookSearchResult.length == 0) {
                  return BookSelectionNoResult();
                } else {
                  return Column(
                    children: view.bookSearchResult.map((item) => BookSelectionResultListItem(item: item)).toList(),
                  );
                }
              } else {
                return Container();
              }
            }),
      ),
    ));
  }
}
