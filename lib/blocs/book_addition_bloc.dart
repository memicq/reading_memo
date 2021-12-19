import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/book_selection_item.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_request.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_result.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/views/phrase_addition/book_search_result.dart';
import 'package:reading_memo/resources/repositories/rakuten_books_repository.dart';
import 'package:rxdart/rxdart.dart';

class BookAdditionBloc {
  SessionState _currentSession;

  RakutenBooksRepository _rakutenBooksRepository;

  final PublishSubject<BookSearchResult> _bookSearchResultPs = PublishSubject<BookSearchResult>();

  Stream<BookSearchResult> get bookSearchResultStream => _bookSearchResultPs.stream;

  BookAdditionBloc() {
    SessionBloc _session = SessionBloc();
    _currentSession = _session.currentState;
    _rakutenBooksRepository = RakutenBooksRepository();
  }

  Future<void> searchBooks(String query) async {
    RakutenBooksSearchApiRequest request = RakutenBooksSearchApiRequest.fromQuery(query);
    RakutenBooksSearchApiResult result = await _rakutenBooksRepository.search(request);

    List<BookSelectionItem> items =
        result.items.map((i) => BookSelectionItem.fromRakutenBooksSearchApiResultItem(i)).toList();

    BookSearchResult _result = BookSearchResult(items: items, isSearchedOnce: true);
    _bookSearchResultPs.sink.add(_result);
  }

  Future<void> selectBook(BookSelectionItem item) {}

  void dispose() {
    _bookSearchResultPs.close();
  }
}
