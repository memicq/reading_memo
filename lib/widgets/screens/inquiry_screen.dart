import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reading_memo/blocs/inquiry_bloc.dart';
import 'package:reading_memo/widgets/components/setting/inquiry/inquiry_template.dart';

class InquiryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<InquiryBloc>(
      create: (context) => InquiryBloc(),
      child: InquiryTemplate(),
      dispose: (context, value) => value.dispose(),
    );
  }

  static void open(BuildContext context, {@required void Function() callback}) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => InquiryScreen(),
            fullscreenDialog: true,
          ),
        )
        .then((value) => callback());
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
