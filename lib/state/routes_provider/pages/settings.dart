import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sound/state/routes_provider/models/settings_data.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building Settings');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose color scheme for AppBar',
                style: TextStyle(
                    color: context.watch<SettingsData>().appBarColor)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<SettingsData>().appBarColor = Colors.blue;
              },
              child: const Text('Blue'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
              onPressed: () {
                context.read<SettingsData>().appBarColor = Colors.purple;
              },
              child: const Text('Purple'),
            ),
          ],
        ),
      ),
    );
  }
}
