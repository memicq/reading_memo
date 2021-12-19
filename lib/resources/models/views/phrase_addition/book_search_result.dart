import 'package:reading_memo/resources/models/book_selection_item.dart';

class BookSearchResult {
  List<BookSelectionItem> items = List.empty();
  bool isSearchedOnce;

  BookSearchResult({
    this.items,
    this.isSearchedOnce = false,
  });
}
