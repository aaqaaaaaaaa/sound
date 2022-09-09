import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController cOl = TextEditingController();
  TextEditingController cUshla = TextEditingController();
  TextEditingController cChiqar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Nafas(),
      builder: (context, child) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: cOl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: cUshla,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: cChiqar,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<Nafas>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Text('${value.ol}', style: textStyle);
                    },
                  ),
                  Text(':', style: textStyle),
                  Consumer<Nafas>(
                    builder: (context, value, Widget? child) {
                      return Text('${value.ushla}', style: textStyle);
                    },
                  ),
                  Text(':', style: textStyle),
                  Consumer<Nafas>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Text('${value.chiqar}', style: textStyle);
                    },
                  ),
                  // Text('${context.watch<Nafas>().chiqar}', style: textStyle)
                ],
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<Nafas>().change(int.parse(cOl.text));
                      context.read<Nafas>().ushla = int.parse(cUshla.text);
                      context.read<Nafas>().chiqar = int.parse(cChiqar.text);
                      context.read<Nafas>().isActive = true;

                      context.read<Nafas>().nafas();
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // return;

                      context.read<Nafas>().changeActive(false);
                      // context.read<Nafas>().nafas(context.read<Nafas>().isActive);
                      var cancel = CancelableOperation.fromFuture(
                              context.read<Nafas>().nafas())
                          .cancel();
                      cancel;
                    },
                    child: const Text(
                      'Stop',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

TextStyle textStyle =
    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

class Nafas with ChangeNotifier {
  int ol = 0, ushla = 0, chiqar = 0;
  bool isActive = false;

  void changeActive(bool active) {
    isActive = active;
    notifyListeners();
  }

  void change(int a) {
    ol = a;
    notifyListeners();
  }

  nafas() async {
    while (true) {
      await harakat(ol);
      await harakat1(ushla);
      await harakat2(chiqar);
    }

    // print(ol);
  }

  // nafas(bool isStop) async {
  //   if (isStop == true) {
  //     while (isStop) {
  //       await harakat(ol, isStop);
  //       await harakat1(ushla, isStop);
  //       await harakat2(chiqar, isStop);
  //     }
  //   }
  //
  //   // print(ol);
  // }

  // harakat(int number, bool isStop) async {
  //   int initialNumber = number;
  //   while (number > 0) {
  //     if (isStop) {
  //       await Future.delayed(
  //         const Duration(seconds: 1),
  //         () {
  //           number--;
  //           ol = number;
  //           notifyListeners();
  //         },
  //       );
  //     }
  //   }
  //   ol = initialNumber;
  // }
  //
  // harakat1(int number, bool isStop) async {
  //   int initialNumber = number;
  //   while (number > 0) {
  //     if (isStop) {
  //       await Future.delayed(
  //         const Duration(seconds: 1),
  //         () {
  //           number--;
  //           ushla = number;
  //           notifyListeners();
  //         },
  //       );
  //     }
  //   }
  //   ushla = initialNumber;
  // }
  //
  // harakat2(int number, bool isStop) async {
  //   int initialNumber = number;
  //   while (number > 0) {
  //     if (isStop) {
  //       await Future.delayed(
  //         const Duration(seconds: 1),
  //         () {
  //           number--;
  //           chiqar = number;
  //           notifyListeners();
  //         },
  //       );
  //     }
  //   }
  //   chiqar = initialNumber;
  // }
  harakat(int number) async {
    int initialNumber = number;
    while (number > 0) {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          number--;
          ol = number;
          notifyListeners();
        },
      );
    }
    ol = initialNumber;
  }

  harakat1(int number) async {
    int initialNumber = number;
    while (number > 0) {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          number--;
          ushla = number;
          notifyListeners();
        },
      );
    }
    ushla = initialNumber;
  }

  harakat2(int number) async {
    int initialNumber = number;
    while (number > 0) {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          number--;
          chiqar = number;
          notifyListeners();
        },
      );
    }
    chiqar = initialNumber;
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({
    Key? key,
    // required this.ol,
    // required this.ushla,
    // required this.chiqar,
  }) : super(key: key);

  // String ol, ushla, chiqar;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${context.watch<Nafas>().ol}', style: textStyle),
                // Consumer<Nafas>(
                //   builder: (BuildContext context, value, Widget? child) {
                //     return ;
                //   },
                // ),
                Text(':', style: textStyle),
                Text('${context.watch<Nafas>().ushla}',
                    style: textStyle), // Consumer<Nafas>(
                //   builder: ( context, value, Widget? child) {
                //     return Text('${value.ushla}',
                //         style: textStyle);
                //   },
                // ),
                Text('${context.watch<Nafas>().chiqar}', style: textStyle),
                Text(':', style: textStyle),
                // Consumer<Nafas>(
                //   builder: (BuildContext context, value, Widget? child) {
                //     return Text('${context.watch<Nafas>().chiqar}',
                //         style: textStyle);
                //   },
                // ),
              ],
            ),
          ),
          const Spacer(flex: 2),
          ElevatedButton(
            onPressed: () {
              // context.read<Nafas>().nafas();
            },
            child: const Text(
              'Start',
              style: TextStyle(fontSize: 20),
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
