import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonBookSelectionInputArea extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final Function(String) search;

  CommonBookSelectionInputArea({@required this.search});

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focusNode);

    return Container(
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
        onEditingComplete: () => search(_controller.value.text),
      ),
    );
  }
}
