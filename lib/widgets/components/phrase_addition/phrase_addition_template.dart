import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/resources/models/phrase_addition_view.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/components/phrase_addition/book_selection_area.dart';
import 'package:reading_memo/widgets/components/phrase_addition/book_selection_result_list.dart';
import 'package:reading_memo/widgets/screen/phrase_addition_screen.dart';

class PhraseAdditionTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    IconButton _closeButton = IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.black54,
        ),
        onPressed: () => PhraseAdditionScreen.close(context)
    );

    return Scaffold(
        appBar: BasicAppBar(title: "フレーズを記録", leading: _closeButton),
        body: Container(
            child: Column(
              children: [
                BookSelectionArea(),
                Expanded(
                  child: BookSelectionResultList(),
                )
              ],
            )
        )
    );
  }
}
