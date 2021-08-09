import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/resources/models/book_selection_item.dart';

class SelectedBookArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PhraseAdditionBloc>(context);
    return StreamBuilder(
        stream: _bloc.selectedItemStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            _bloc.fetchSelectedItem();
            return Container();
          }

          BookSelectionItem _item = snapshot.data;

          return Container(
            width: double.infinity,
            constraints: BoxConstraints(maxHeight: 100),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.black26))),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print("aaa");
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text("選択中: ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16
                              )
                          ),
                          Expanded(
                              child: Text(
                                _item.title,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ))
                        ],
                      )),
                )),
          );
        });
  }
}