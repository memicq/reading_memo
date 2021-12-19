import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';
import 'package:rxdart/rxdart.dart';

class SettingBloc {
  // ps
  final PublishSubject<UserRow> _userRowPs = PublishSubject<UserRow>();

  Stream<UserRow> get userRowStream => _userRowPs.stream;

  UserRow _userRow;
  SessionBloc _session = SessionBloc();

  SettingBloc() {
    fetchAccount();
  }

  void fetchAccount() async {
    _userRow = _session.currentState?.user;
    _userRowPs.sink.add(_userRow);
  }

  void dispose() {
    _userRowPs.close();
  }
}
