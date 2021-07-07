import 'package:flutter/material.dart';

import 'book_selection_item.dart';

class PhraseAdditionView {
  bool _isBookSelecting;
  List<BookSelectionItem> _bookSearchResult;
  BookSelectionItem _selectedItem;

  bool get isBookSelecting => this._isBookSelecting;
  set isBookSelecting(bool isBookSelecting) {
    this._isBookSelecting = isBookSelecting;
  }

  List<BookSelectionItem> get bookSearchResult => this._bookSearchResult;
  set bookSearchResult(List<BookSelectionItem> result) {
    this._bookSearchResult = result;
  }

  BookSelectionItem get selectedItem => this._selectedItem;
  set selectedItem(BookSelectionItem item) {
    this._selectedItem = item;
    this._bookSearchResult = List.empty();
    this._isBookSelecting = false;
  }
}