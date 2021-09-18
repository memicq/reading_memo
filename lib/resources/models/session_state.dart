import 'package:reading_memo/resources/models/tables/user_row.dart';

class SessionState {
  bool isLoading;
  UserRow user;
  String msg;

  SessionState({this.isLoading = true, this.user = null, this.msg = ''});

  bool shouldShowSignInScreen() => !this.isLoading && this.user == null;

  @override
  String toString() => 'SessionState<isLoading=$isLoading, user=$user, msg=$msg>';
}