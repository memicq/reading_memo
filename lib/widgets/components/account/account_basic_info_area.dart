import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/account_bloc.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';

class AccountBasicInfoArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountBloc _bloc = Provider.of<AccountBloc>(context);
    return StreamBuilder(
        stream: _bloc.userRowStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          UserRow _user = snapshot.data;
          return Container(
            child: Column(
              children: [
                Text(_user.email),
                Text(_user.displayName)
              ],
            ),
          );
        }
    );
  }
}