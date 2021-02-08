import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartsWidgetState();
  }
}

class ChartsWidgetState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:  Text('Settings!'),
      onPressed: () => print('Chart!'),
    );
  }
}
