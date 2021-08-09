import 'package:flutter/material.dart';
import 'package:reading_memo/resources/models/home_item_view.dart';
import 'package:reading_memo/widgets/styles/color_const.dart';

class HomeItemHeaderPopupMenu extends StatefulWidget {
  final HomeItem item;
  HomeItemHeaderPopupMenu({@required this.item});

  @override
  State<StatefulWidget> createState() => HomeItemHeaderPopupMenuState();
}

class HomeItemHeaderPopupMenuState extends State<HomeItemHeaderPopupMenu> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.more_horiz,
          size: 20,
          color: ColorConst.disabledColor,
        ),
        onPressed: (){
          print("${widget.item.bookTitle}");
        }
      ),
    );
  }
}