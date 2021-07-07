
import 'package:flutter/material.dart';

class PhraseAdditionButton extends StatelessWidget {
  Function onPressed = (){};
  PhraseAdditionButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: Container(
        height: 55,
        width: 55,
        alignment: Alignment.center,
        child: Icon(Icons.note_add),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
        primary: Colors.white,
        onPrimary: Colors.black54,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.black87,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}