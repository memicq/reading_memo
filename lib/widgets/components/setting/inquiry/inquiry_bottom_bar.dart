import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/inquiry_bloc.dart';
import 'package:reading_memo/resources/models/tables/inquiry_row.dart';
import 'package:reading_memo/widgets/components/common/ios_bottom_space.dart';
import 'package:reading_memo/widgets/screens/inquiry_screen.dart';

class InquiryBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InquiryBloc _bloc = Provider.of<InquiryBloc>(context);

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
              StreamBuilder<InquiryRow>(
                stream: _bloc.inquiryStream,
                builder: (context, snapshot) {
                  InquiryRow _inquiryRow = snapshot.data;
                  Function() onPressed;

                  if (_inquiryRow != null && _inquiryRow.canSubmit) {
                    onPressed = () {
                      _bloc.submit();
                      InquiryScreen.close(context);
                    };
                  }

                  return TextButton(
                    onPressed: onPressed,
                    child: Text(
                      "送信",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              )
            ],
          ),
          IosBottomSpace(),
        ],
      ),
    );
  }
}
