import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';
import 'package:reading_memo/resources/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class SettingBloc {
  UserRepository _userRepository = UserRepository();

  final _userRowPublishSubject = PublishSubject<UserRow>();

  Stream<UserRow> get userRowStream => _userRowPublishSubject.stream;

  UserRow _userRow;
  SessionBloc _session = SessionBloc();

  SettingBloc() {
    fetchAccount();
  }

  void fetchAccount() async {
    _userRow = _session.currentState?.user;
    _userRowPublishSubject.sink.add(_userRow);
  }

  void dispose() {
    _userRowPublishSubject.close();
  }
}
