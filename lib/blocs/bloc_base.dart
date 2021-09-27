import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/session_state.dart';

abstract class BlocBase {
  SessionState session;

  BlocBase() {
    SessionBloc _sessionBloc = SessionBloc();
    session = _sessionBloc.currentState;
  }
}
