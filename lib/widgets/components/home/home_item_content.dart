import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/widgets/styles/text_style_const.dart';

class HomeItemContent extends StatelessWidget {
  final HomeItem item;
  HomeItemContent({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                constraints: BoxConstraints.expand(),
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "${this.item.bookTitle} / ${this.item.authorNames.join(',')}",
                        style: TextStyleConst.timelineBookStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          border: const Border(
                              left: const BorderSide(color: Colors.black12, width: 5)
                          )
                      ),
                      child: Text(
                          this.item.quotedText,
                          style: TextStyleConst.timelineQuotedTextStyle
                      ),
                ),
              ],
            ),
          )),
          Container(
            width: 50,
            child: Image.network(this.item.imageUrl),
          )
        ],
      ),
    );
  }
}
