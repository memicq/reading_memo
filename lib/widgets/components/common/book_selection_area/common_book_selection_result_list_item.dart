import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/book_selection_item.dart';

class CommonBookSelectionResultListItem extends StatelessWidget {
  final BookSelectionItem item;

  final Function(BookSelectionItem) selectBook;

  CommonBookSelectionResultListItem({
    @required this.item,
    @required this.selectBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: const BorderSide(color: Colors.black12, width: 0.25),
          bottom: const BorderSide(color: Colors.black12, width: 0.25),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => selectBook(item),
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
                        Text(
                          this.item.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          this.item.author,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          this.item.publisherName,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
