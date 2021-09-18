import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/global/session_bloc.dart';
import 'package:reading_memo/blocs/sign_in_bloc.dart';
import 'package:reading_memo/widgets/components/sign_in/sign_in_template.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SignInBloc>(
      create: (context) => SignInBloc(),
      child: SignInTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }

  static void open(BuildContext context, {@required void Function() callback}) {
    print('SignInScreen.open');
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => SignInScreen(),
            fullscreenDialog: true
        )
    ).then((value) => callback());
  }

  static void close(BuildContext context) {
    print('SignInScreen.close');
    Navigator.of(context).pop();
  }
}