import 'package:reading_memo/blocs/bloc_base.dart';
import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/book_selection_item.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_request.dart';
import 'package:reading_memo/resources/models/rakuten_books_search_api_result.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/resources/models/tables/phrase_row.dart';
import 'package:reading_memo/resources/models/views/phrase_addition/book_search_result.dart';
import 'package:reading_memo/resources/repositories/phrase_repository.dart';
import 'package:reading_memo/resources/repositories/rakuten_books_repository.dart';
import 'package:rxdart/rxdart.dart';

class PhraseAdditionBloc extends BlocBase {
  RakutenBooksRepository _rakutenBooksRepository;
  PhraseRepository _phraseRepository;

  // publish subjects
  final _isBookSelectingPs = PublishSubject<bool>();
  final _bookSearchResultPs = PublishSubject<BookSearchResult>();
  final _selectedItemPs = PublishSubject<BookSelectionItem>();
  final _phraseTextPs = PublishSubject<String>();

  // stream
  Stream<bool> get isBookSelectingStream => _isBookSelectingPs.stream;

  Stream<BookSearchResult> get bookSearchResultStream =>
      _bookSearchResultPs.stream;

  Stream<BookSelectionItem> get selectedItemStream => _selectedItemPs.stream;

  Stream<String> get phraseTextStream => _phraseTextPs.stream;

  // initialization
  bool _isBookSelecting = true;
  BookSearchResult _result = BookSearchResult();
  BookSelectionItem _selectedItem;
  String _phraseText = "";

  SessionState _currentSession;

  PhraseAdditionBloc() {
    SessionBloc _bloc = SessionBloc();
    _currentSession = _bloc.currentState;
    _phraseRepository = PhraseRepository(session: _currentSession);
    _rakutenBooksRepository = RakutenBooksRepository();
  }

  void fetchSelectedItem() {
    _selectedItemPs.sink.add(_selectedItem);
  }

  void dispose() {
    _isBookSelectingPs.close();
    _bookSearchResultPs.close();
    _selectedItemPs.close();
    _phraseTextPs.close();
  }

  Future<void> searchBooks(String query) async {
    RakutenBooksSearchApiRequest request =
        RakutenBooksSearchApiRequest.fromQuery(query);
    RakutenBooksSearchApiResult result =
        await _rakutenBooksRepository.search(request);

    List<BookSelectionItem> items = result.items
        .map((i) => BookSelectionItem.fromRakutenBooksSearchApiResultItem(i))
        .toList();

    _result.isSearchedOnce = true;
    _result.items = items;
    _bookSearchResultPs.sink.add(_result);
  }

  void selectBookItem(BookSelectionItem item) {
    _isBookSelecting = false;
    _isBookSelectingPs.sink.add(_isBookSelecting);
    _selectedItem = item;
    _selectedItemPs.sink.add(_selectedItem);
  }

  void updatePhraseText(String text) {
    _phraseText = text;
    _phraseTextPs.sink.add(_phraseText);
  }

  Future<void> savePhraseText() async {
    BookRow _book = BookRow(
        generateId: true,
        isbnCode10: _selectedItem.isbn,
        isbnCode13: null,
        bookTitle: _selectedItem.title,
        authors: _selectedItem.author.split(','),
        referenceUrl: _selectedItem.itemUrl,
        imageUrl: _selectedItem.largeImageUrl,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    PhraseRow _phrase = PhraseRow(
        generateId: true,
        quotedText: _phraseText,
        pageNumber: '123',
        bookId: _book.bookId,
        postedUserId: _currentSession.user.userId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    await _phraseRepository.create(_phrase, _book);
  }
}
