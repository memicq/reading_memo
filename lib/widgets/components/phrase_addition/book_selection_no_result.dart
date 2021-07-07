import 'package:flutter/material.dart';

class BookSelectionNoResult extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 150),
        width: double.infinity,
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              Icon(Icons.search_off_rounded, size: 100, color: Colors.black26),
              Text("結果が見つかりませんでした", style: TextStyle(color: Colors.black54))
            ],
          ),
        ),
    );
  }
}