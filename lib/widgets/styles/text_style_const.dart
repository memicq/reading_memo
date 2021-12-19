import 'package:flutter/material.dart';

import 'color_const.dart';

class TextStyleConst {
  // global
  static TextStyle appBarTitleStyle =
      TextStyle(color: FontColorConst.defaultColor, fontSize: 16, fontFamily: "Noto Sans JP");

  // timeline
  static TextStyle timelineUserNameTextStyle =
      TextStyle(color: Color(0xff383838), fontSize: 15, fontFamily: "Noto Sans JP");
  static TextStyle timelinePostedDateTextStyle =
      TextStyle(color: Colors.black54, fontSize: 13, fontFamily: "Noto Sans JP");
  static TextStyle timelineQuotedTextStyle =
      TextStyle(color: Color(0xff545454), fontSize: 14, fontFamily: "Shippori Mincho");
  static TextStyle timelineBookStyle = TextStyle(color: Color(0xff383838), fontSize: 14, fontFamily: "Noto Sans JP");
}
