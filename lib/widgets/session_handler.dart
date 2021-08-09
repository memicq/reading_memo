import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/session_bloc.dart';
import 'package:reading_memo/widgets/main_layout.dart';

class SessionHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SessionBloc>(
        create: (context) => SessionBloc(),
        dispose: (context, value) => value.dispose(),
        child: MainLayout()
    );
  }
}

