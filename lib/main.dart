import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sound/projects/object_box/helper/object_box.dart';
import 'package:sound/projects/object_box/object_box_example.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ObjectBoxPage(),
    );
  }
}
