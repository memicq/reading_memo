import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reading_memo/widgets/main_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainLayout());
}

// @see(https://qiita.com/kabochapo/items/8738223894fb74f952d3)