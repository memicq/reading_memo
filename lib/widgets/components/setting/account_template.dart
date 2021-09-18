import 'package:flutter/material.dart';
import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/components/setting/account_basic_info_area.dart';

class SettingTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SessionBloc _session = SessionBloc();
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
