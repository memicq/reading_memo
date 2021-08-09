import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/home_bloc.dart';
import 'package:reading_memo/blocs/session_bloc.dart';
import 'package:reading_memo/widgets/components/home/home_template.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SessionBloc _session = Provider.of<SessionBloc>(context);
    return Provider<HomeBloc>(
      create: (context) => HomeBloc(_session.currentState),
      child: HomeTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }
}
