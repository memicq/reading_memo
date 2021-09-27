import 'package:flutter/material.dart';
import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/components/setting/account_basic_info_area.dart';
import 'package:reading_memo/widgets/components/setting/inquiry_template.dart';
import 'package:reading_memo/widgets/components/setting/setting_item/setting_item_button.dart';
import 'package:reading_memo/widgets/components/setting/setting_item/setting_item_page_link.dart';

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
            SettingItemPageLink(
              content: Center(child: Text("お問い合わせ")),
              iconData: Icons.comment_outlined,
              templateScaffold: InquiryTemplate(),
            ),
            SettingItemButton(
              content: Center(
                child: Text(
                  "ログアウト",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              onPressed: () => _session.signOut(),
              needTopSpace: true,
            ),
          ],
        ),
      ),
    );
  }
}
