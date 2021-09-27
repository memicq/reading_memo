import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/repositories/rakuten_books_repository.dart';

class BookAdditionBloc {
  BookAdditionBloc();

  SessionState _currentSession;
  RakutenBooksRepository _rakutenBooksRepository;

  void dispose() {
    SessionBloc _session = SessionBloc();
    _currentSession = _session.currentState;
    _rakutenBooksRepository = RakutenBooksRepository();
  }
}
