import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';

class BookSelectionArea extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PhraseAdditionBloc>(context);

    FocusScope.of(context).requestFocus(_focusNode);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            prefixIcon: Padding(
                padding: EdgeInsets.only(left: 15, right: 5),
                child: Text("本を検索:",
                    style: TextStyle(color: Colors.black54, fontSize: 16))),
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            hintText: "タイトルや著者名、ISBNコードで検索",
            hintStyle: TextStyle(color: Colors.black26),
            border: InputBorder.none),
        onEditingComplete: () => _bloc.searchBooks(_controller.value.text),
      ),
    );
  }
}
