import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/widgets/components/phrase_addition/phrase_addition_template.dart';

class PhraseAdditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PhraseAdditionBloc>(
      create: (context) => PhraseAdditionBloc(),
      child: PhraseAdditionTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }

  static void open(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PhraseAdditionScreen(),
        fullscreenDialog: true));
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}