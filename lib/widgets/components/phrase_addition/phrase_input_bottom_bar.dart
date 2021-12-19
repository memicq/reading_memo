import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/phrase_addition_bloc.dart';
import 'package:reading_memo/widgets/components/common/ios_bottom_space.dart';
import 'package:reading_memo/widgets/screens/phrase_addition_screen.dart';

class PhraseInputBottomBar extends StatelessWidget {
  Future<void> submitPhrase(
    BuildContext context,
    PhraseAdditionBloc phraseAdditionBloc,
  ) async {
    await phraseAdditionBloc.savePhraseText();
    PhraseAdditionScreen.close(context);
  }

  @override
  Widget build(BuildContext context) {
    PhraseAdditionBloc _bloc = Provider.of<PhraseAdditionBloc>(context);
    return StreamBuilder(
      initialData: "",
      stream: _bloc.phraseTextStream,
      builder: (context, snapshot) {
        String phraseText = snapshot.hasData ? snapshot.data : "";
        bool isInputted = snapshot.hasData ? snapshot.data != "" : false;
        Function onPressed =
            isInputted ? () => submitPhrase(context, _bloc) : null;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.black26, width: 0.5),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "${phraseText.length.toString()} / 255文字",
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      "保存",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              IosBottomSpace(),
            ],
          ),
        );
      },
    );
  }
}
