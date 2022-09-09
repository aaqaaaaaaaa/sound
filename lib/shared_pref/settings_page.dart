import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const Card(
            child: ListTile(
              title: Text('Theme'),
            ),
          ),
          SwitchListTile(
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
