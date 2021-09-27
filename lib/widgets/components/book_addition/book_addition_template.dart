import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reading_memo/widgets/components/common/basic_app_bar.dart';

class BookAdditionTemplate extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focusNode);

    return Scaffold(
      appBar: BasicAppBar(
        title: "本を追加",
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.black26),
          ),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 15, right: 5),
              child: Text(
                "本を検索:",
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            hintText: "タイトルや著者名、ISBNコードで検索",
            hintStyle: TextStyle(color: Colors.black26),
            border: InputBorder.none,
          ),
          // onEditingComplete: () => _bloc.searchBooks(_controller.value.text),
        ),
      ),
    );
  }
}
