import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/resources/models/tables/phrase_row.dart';
import 'package:reading_memo/resources/repositories/phrase_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  PhraseRepository _phraseRepository = PhraseRepository();

  final _homeItemPublishSubject = PublishSubject<List<HomeItem>>();

  Stream<List<HomeItem>> get homeItemStream => _homeItemPublishSubject.stream;

  SessionState _currentState;

  HomeBloc(SessionState currentState) {
    _currentState = currentState;
    if (_currentState?.user != null) {
      fetchHomeItems();
    }
  }

  Future<void> fetchHomeItems() async {
    List<Map<String, dynamic>> _phraseBooks = await _phraseRepository.list(_currentState.user.userId);
    List<HomeItem> _homeItemViews = _phraseBooks.map((phraseBook) {
      PhraseRow _p = phraseBook['phrase'];
      BookRow _b = phraseBook['book'];
      return HomeItem(
          phraseId: _p.phraseId,
          quotedText: _p.quotedText,
          bookTitle: _b.bookTitle,
          imageUrl: _b.imageUrl,
          authorNames: _b.authors,
          createdAt: _p.createdAt,
          postedUserId: _p.postedUserId,
          postedUserName: _currentState.user.email,
          postedUserDisplayName: _currentState.user.displayName
      );
    }).toList();
    _homeItemPublishSubject.sink.add(_homeItemViews);
  }

  void dispose() {
    _homeItemPublishSubject.close();
  }
}