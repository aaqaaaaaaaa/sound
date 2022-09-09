import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build MainPage');
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.watch<AppData>().name),
          ),
          body: const Screen1(),
        );
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Screen2();
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Screen3();
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(context.watch<AppData>().name),
        ElevatedButton(
            onPressed: () {
              context.read<AppData>().changeData('Jalolxon');
            },
            child: const Text('Change data'))
      ],
    );
  }
}

class AppData extends ChangeNotifier {
  String name = 'Computer';

  void changeData(String name) {
    this.name = name;
    notifyListeners();
  }
}
