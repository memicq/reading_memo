import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/widgets/components/home/home_item_header_popup_menu.dart';
import 'package:reading_memo/widgets/styles/text_style_const.dart';

class HomeItemHeader extends StatelessWidget {
  final HomeItem item;
  HomeItemHeader({@required this.item});

  final DateFormat _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("@${this.item.postedUserDisplayName}", style: TextStyleConst.timelineUserNameTextStyle),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${_formatter.format(this.item.createdAt)}",
                    style: TextStyleConst.timelinePostedDateTextStyle),
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: HomeItemHeaderPopupMenu(item: this.item)
                )
              ],
            )
          ],
        )
    );
  }
}

