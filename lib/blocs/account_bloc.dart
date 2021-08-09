import 'package:firebase_auth/firebase_auth.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';
import 'package:reading_memo/resources/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class AccountBloc {
  UserRepository _userRepository = UserRepository();

  final _userRowPublishSubject = PublishSubject<UserRow>();
  Stream<UserRow> get userRowStream => _userRowPublishSubject.stream;

  UserRow _userRow;

  AccountBloc(){
    fetchAccount();
  }

  void fetchAccount() async {
    User user = FirebaseAuth.instance.currentUser;
    _userRow = await _userRepository.getByEmail(user.email);
    _userRowPublishSubject.sink.add(_userRow);
  }

  void dispose() {
    _userRowPublishSubject.close();
  }
}