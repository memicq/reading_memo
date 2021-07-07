import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/resources/models/book_selection_item.dart';

class BookSelectionResultListItem extends StatelessWidget {
  BookSelectionItem item;

  BookSelectionResultListItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<PhraseAdditionBloc>(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
              top: const BorderSide(color: Colors.black12, width: 0.25),
              bottom: const BorderSide(color: Colors.black12, width: 0.25))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              _bloc.selectBookItem(item);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Image.network(this.item.largeImageUrl, width: 80, height: 120),
                  Expanded(
                    child: Container(
                      height: 120,
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(this.item.title),
                          Text(this.item.author),
                          Text(this.item.publisherName),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
