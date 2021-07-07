
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget with PreferredSizeWidget {
  double searchBoxHeight = 40.0;

  @override
  Size get preferredSize => Size.fromHeight(searchBoxHeight);

  @override
  State<StatefulWidget> createState() => SearchBoxState();
}

class SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            hintText: "検索",
            fillColor: Color(0xffeeeeee),
            filled: true,
            prefixIcon: Icon(Icons.search_rounded),
            border: OutlineInputBorder()
        ),
      ),
    );
  }
}