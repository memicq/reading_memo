import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';
import 'package:reading_memo/widgets/components/common/book_selection_area/common_book_selection_input_area.dart';
import 'package:reading_memo/widgets/components/phrase_addition/book_selection_result_area.dart';
import 'package:reading_memo/widgets/components/phrase_addition/phrase_input_area.dart';
import 'package:reading_memo/widgets/components/phrase_addition/phrase_input_bottom_bar.dart';
import 'package:reading_memo/widgets/components/phrase_addition/selected_book_area.dart';
import 'package:reading_memo/widgets/screens/phrase_addition_screen.dart';

class PhraseAdditionTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PhraseAdditionBloc>(context);

    IconButton _closeButton = IconButton(
      icon: Icon(
        Icons.close,
        color: Colors.black54,
      ),
      onPressed: () => PhraseAdditionScreen.close(context),
    );

    return Scaffold(
      appBar: BasicAppBar(title: "フレーズを記録", leading: _closeButton),
      body: StreamBuilder(
        initialData: true,
        stream: _bloc.isBookSelectingStream,
        builder: (context, snapshot) {
          bool _isBookSelecting = snapshot.hasData ? snapshot.data : true;
          if (_isBookSelecting) {
            return Container(
              child: Column(
                children: [
                  CommonBookSelectionInputArea(
                    search: (query) => _bloc.searchBooks(query),
                  ),
                  Expanded(child: BookSelectionResultArea())
                ],
              ),
            );
          } else {
            return Container(
              child: Column(
                children: [
                  SelectedBookArea(),
                  Expanded(child: PhraseInputArea()),
                  PhraseInputBottomBar()
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
