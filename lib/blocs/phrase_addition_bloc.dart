import 'package:reading_memo/resources/models/book_selection_item.dart';
import 'package:reading_memo/resources/models/phrase_addition_view.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_request.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_result.dart';
import 'package:reading_memo/resources/repositories/rakuten_books_repository.dart';
import 'package:rxdart/rxdart.dart';

class PhraseAdditionBloc {
  RakutenBooksRepository _rakutenBooksRepository = RakutenBooksRepository();

  final _bookSearchResultPublishSubject = PublishSubject<PhraseAdditionView>();
  Stream<PhraseAdditionView> get bookSearchResultStream => _bookSearchResultPublishSubject.stream;

  PhraseAdditionView _view = PhraseAdditionView();

  PhraseAdditionBloc(){}

  void dispose() {
    _bookSearchResultPublishSubject.close();
  }

  Future<void> searchBooks(String query) async {
    RakutenBooksSearchApiRequest request = RakutenBooksSearchApiRequest.fromQuery(query);
    RakutenBooksSearchApiResult result = await _rakutenBooksRepository.search(request);

    List<BookSelectionItem> items = result.items.map((i) =>
        BookSelectionItem.fromRakutenBooksSearchApiResultItem(i)).toList();

    _view.bookSearchResult = items;
    _bookSearchResultPublishSubject.sink.add(_view);
  }

  void selectBookItem(BookSelectionItem item) {
    _view.selectedItem = item;
    _bookSearchResultPublishSubject.sink.add(_view);
  }

}
