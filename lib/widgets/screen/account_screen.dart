import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/account_bloc.dart';
import 'package:reading_memo/widgets/components/account/account_template.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AccountBloc>(
      create: (context) => AccountBloc(),
      child: AccountTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }
}