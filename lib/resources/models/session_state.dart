import 'package:reading_memo/resources/models/tables/user_row.dart';

class SessionState {
  bool isFetchedOnce;
  UserRow user;
  String msg;

  SessionState({this.isFetchedOnce = false, this.user = null, this.msg = ''});

  bool shouldShowSignInScreen() => this.isFetchedOnce && this.user == null;

  @override
  String toString() => 'SessionState<$isFetchedOnce:$user:$msg>';
}