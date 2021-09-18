import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reading_memo/resources/models/enums/login_type.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';
import 'package:reading_memo/resources/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class SessionBloc {
  // singleton: シングルトンパターン
  static final SessionBloc _instance = SessionBloc._internal();

  factory SessionBloc() => _instance;

  SessionBloc._internal() {
    print('SessionBloc.constructor');
    checkInitialSessionState();
  }

  UserRepository _userRepository = UserRepository();

  final _currentStateBehaviourSubject =
      BehaviorSubject<SessionState>.seeded(SessionState(msg: 'initialData'));

  Stream<SessionState> get currentStateStream =>
      _currentStateBehaviourSubject.stream;

  SessionState _currentState;

  SessionState get currentState => _currentState;

  Future<void> checkInitialSessionState() async {
    print('SessionBloc.checkInitialSessionState');
    User _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      UserRow _currentUser = await _userRepository.getByEmail(_user.email);
      _currentState = SessionState(
          isLoading: false, user: _currentUser, msg: 'nonInitialData');
    } else {
      _currentState =
          SessionState(isLoading: false, user: null, msg: 'nonInitialData');
    }
    print('SessionBloc.init - $_currentState');
    _currentStateBehaviourSubject.sink.add(_currentState);
  }

  void signIn(LoginType loginType) async {
    print('SessionBloc.signIn');
    switch (loginType) {
      case LoginType.GOOGLE:
        UserRow _currentUser =
            await _signInWithErrorHandle(doSignIn: _signInWithGoogle);
        _currentState =
            SessionState(isLoading: false, user: _currentUser, msg: 'signIn');
        _currentStateBehaviourSubject.sink.add(_currentState);
        break;
      default:
        _currentState = SessionState(isLoading: false, msg: 'signIn');
        _currentStateBehaviourSubject.sink.add(_currentState);
        print("not implemented");
    }
  }

  Future<UserRow> _signInWithErrorHandle(
      {@required Future<UserCredential> Function() doSignIn}) async {
    try {
      UserCredential userCredential = await doSignIn();
      return await _upsertUserRow(userCredential);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException');
      print('${e.code}');
    } on Exception catch (e) {
      print('Other Exception');
      print('${e.toString()}');
    }
  }

  Future<UserCredential> _signInWithGoogle() async {
    final googleUser = await GoogleSignIn(scopes: ['email']).signIn();
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserRow> _upsertUserRow(UserCredential userCredential) async {
    UserRow _user = await _userRepository.getByEmail(userCredential.user.email);

    if (_user == null) {
      _user = UserRow(
          generateId: true,
          email: userCredential.user.email,
          encryptedPassword: "",
          displayName: userCredential.user.displayName,
          loginType: LoginType.GOOGLE,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now());
      await _userRepository.create(_user);
    }

    return _user;
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    _currentState = SessionState(isLoading: false, user: null);
    _currentStateBehaviourSubject.sink.add(_currentState);
  }

  void dispose() {
    _currentStateBehaviourSubject.close();
  }
}
