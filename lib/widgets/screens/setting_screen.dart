import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/account_bloc.dart';
import 'package:reading_memo/widgets/components/setting/account_template.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SettingBloc>(
      create: (context) => SettingBloc(),
      child: SettingTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }
}
