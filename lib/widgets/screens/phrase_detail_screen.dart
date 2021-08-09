import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_detail_bloc.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/widgets/components/phrase_detail/phrase_detail_template.dart';

class PhraseDetailScreen extends StatelessWidget {
  final HomeItem item;
  PhraseDetailScreen({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Provider<PhraseDetailBloc>(
      create: (context) => PhraseDetailBloc(),
      child: PhraseDetailTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }
}