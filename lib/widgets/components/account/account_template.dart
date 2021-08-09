import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/session_bloc.dart';
import 'package:reading_memo/widgets/components/account/account_basic_info_area.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

class AccountTemplate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SessionBloc _session = Provider.of<SessionBloc>(context, listen: false);
    return Scaffold(
      appBar: BasicAppBar(title: "アカウント"),
      body: Container(
        child: Column(
          children: [
            AccountBasicInfoArea(),
            Center(
                child: ElevatedButton(
                  onPressed: () => _session.signOut(),
                  child: Text("ログアウト"),
                )
            )
          ],
        ),
      ),
    );
  }
}