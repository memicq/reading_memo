import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reading_memo/resources/models/book_selection_item.dart';
import 'package:reading_memo/resources/models/views/phrase_addition/book_search_result.dart';
import 'package:reading_memo/widgets/components/common/book_selection_area/common_book_selection_no_result.dart';
import 'package:reading_memo/widgets/components/common/book_selection_area/common_book_selection_result_list_item.dart';

class CommonBookSelectionResultList extends StatelessWidget {
  final BookSearchResult result;

  final Function(BookSelectionItem) selectBook;

  CommonBookSelectionResultList({
    @required this.result,
    @required this.selectBook,
  });

  @override
  Widget build(BuildContext context) {
    if (result.isSearchedOnce && result.items.length == 0) {
      return CommonBookSelectionNoResult();
    } else {
      return Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 50),
            width: double.infinity,
            child: Column(
              children: result.items
                  .map(
                    (item) => CommonBookSelectionResultListItem(
                      item: item,
                      selectBook: selectBook,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    }
  }
}
