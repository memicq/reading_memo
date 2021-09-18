import 'package:flutter/material.dart';
import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';

class AccountBasicInfoArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SessionBloc _session = SessionBloc();
    return StreamBuilder(
      stream: _session.currentStateStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        UserRow _user = (snapshot.data as SessionState)?.user;
        return Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(_user.email),
              Text(_user.displayName),
            ],
          ),
        );
      },
    );
  }
}
