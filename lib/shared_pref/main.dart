import 'package:flutter/material.dart';
import 'package:sound/shared_pref/settings_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SettingPage(),
    );
  }
}
