import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/styles/color_const.dart';
import 'package:reading_memo/styles/text_style_const.dart';

class HomeItem extends StatelessWidget {
  HomeItemView itemView;

  HomeItem({@required this.itemView});

  Widget buildTextLink(String text) {
    return SizedBox(
        height: 20,
        child: TextButton(
          onPressed: () {},
          child: Text(text, style: TextStyleConst.timelineBookStyle),
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(0),
              minimumSize: Size(5, 10)
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
//      onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
              border: const Border(
              top: const BorderSide(color: Colors.black12, width: 0.25),
              bottom: const BorderSide(color: Colors.black12, width: 0.25))),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("@username", style: TextStyleConst.timelineUserNameTextStyle),
                Row(
                  children: [
                    Text("2021/6/20", style: TextStyleConst.timelinePostedDateTextStyle),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.more_horiz, size: 20, color: ColorConst.disabledColor,)
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                border: const Border(
                    left: const BorderSide(color: Colors.black12, width: 5))),
            child: Text(this.itemView.quotedText, style: TextStyleConst.timelineQuotedTextStyle),
          ),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildTextLink("『 ${this.itemView.bookTitle} 』"),
                  buildTextLink(this.itemView.authorName)
                ],
              )
          )
        ],
      ),
    ));
  }
}
