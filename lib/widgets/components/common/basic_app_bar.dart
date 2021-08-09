import 'package:flutter/material.dart';
import 'package:reading_memo/widgets/styles/color_const.dart';
import 'package:reading_memo/widgets/styles/text_style_const.dart';

class BasicAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  Widget leading;

  AppBar _appBar;

  BasicAppBar({
    @required this.title,
    this.leading
  }){
    _appBar = AppBar(
      title: Text(
        this.title,
        style: TextStyleConst.appBarTitleStyle,
      ),
      backgroundColor: Colors.white,
      bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              color: ColorConst.appBarBottomLineColor,
              height: 1.0,
            ),
            height: 1.0,
          ),
          preferredSize: Size.fromHeight(1.0)),
      leading: this.leading,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(_appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return _appBar;
  }
}