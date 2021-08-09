import 'package:flutter/material.dart';

class HomeItemListNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      padding: EdgeInsets.only(top: 150),
      alignment: Alignment.center,
      child: Center(
        child: Column(
          children: [
            Text("アイテムが見つかりませんでした。", style: TextStyle(color: Colors.black54)),
            Text(
              "右下のボタンより新たにフレーズを登録すれば、",
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            Text(
              "ホーム画面に表示されます。",
              style: TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}