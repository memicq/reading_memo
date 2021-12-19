import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reading_memo/resources/models/tables/book_row.dart';
import 'package:reading_memo/widgets/screens/book_detail_screen.dart';

class BookListItem extends StatelessWidget {
  final BookRow book;

  BookListItem({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.black26, width: 0.1),
          bottom: BorderSide(color: Colors.black26, width: 0.1),
        ),
      ),
      child: InkWell(
        onTap: () {
          BookDetailScreen.open(context, book);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Image.network(this.book.imageUrl, width: 70, height: 105),
              Expanded(
                child: Container(
                  height: 120,
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.book.bookTitle,
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      Text(
                        this.book.authors.join(' / '),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black45, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
