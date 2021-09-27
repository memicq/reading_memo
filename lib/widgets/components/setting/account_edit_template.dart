import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/enums/login_type.dart';
import 'package:reading_memo/resources/models/tables/user_row.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

class AccountEditTemplate extends StatelessWidget {
  UserRow user;

  AccountEditTemplate({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: "アカウント詳細",
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(user.displayName),
              Text(user.email),
              Text(user.encryptedPassword),
              Text("${user.loginType.japaneseName}でログイン"),
              Text(user.updatedAt.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
