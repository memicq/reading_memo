import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reading_memo/widgets/session_handler.dart';
import 'package:reading_memo/widgets/styles/color_const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MaterialApp(
          theme: ThemeData(
            backgroundColor: ColorConst.backgroundColor,
            fontFamily: 'Noto Sans JP',
          ),
          home: SessionHandler()
      )
  );
}

// @see(https://qiita.com/kabochapo/items/8738223894fb74f952d3)