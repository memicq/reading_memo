import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';

class PhraseInputArea extends StatelessWidget {
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    PhraseAdditionBloc _bloc = Provider.of<PhraseAdditionBloc>(context);
    FocusScope.of(context).requestFocus(_focusNode);

    return Scrollbar(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            color: Colors.white,
            child: TextField(
              focusNode: _focusNode,
              keyboardType: TextInputType.multiline,
              showCursor: true,
              maxLines: null,
              style: TextStyle(fontSize: 15, color: Colors.black87),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "フレーズを入力"
              ),
              onChanged: (text) => _bloc.updatePhraseText(text)
            )
        )
    );
  }
}
