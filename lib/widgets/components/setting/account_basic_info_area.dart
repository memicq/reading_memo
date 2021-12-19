import 'package:flutter/material.dart';
import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/resources/models/enums/login_type.dart';
import 'package:reading_memo/resources/models/session_state.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';
import 'package:reading_memo/widgets/components/setting/account_edit_template.dart';
import 'package:reading_memo/widgets/components/setting/setting_item/setting_item_page_link.dart';

class AccountBasicInfoArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SessionBloc _session = SessionBloc();
    return StreamBuilder(
      stream: _session.currentStateStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Container();

        UserRow _user = (snapshot.data as SessionState)?.user;
        return SettingItemPageLink(
          content: Column(
            children: [Text(_user.displayName), Text(_user.loginType.japaneseName + "でログイン")],
          ),
          iconData: Icons.account_circle_rounded,
          screen: AccountEditTemplate(user: _user),
          needTopSpace: true,
        );
      },
    );
  }
}
