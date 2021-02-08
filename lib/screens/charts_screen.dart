import 'package:flutter/material.dart';

class ChartsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartsWidgetState();
  }
}

class ChartsWidgetState extends State<ChartsScreen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:  Text('Chart!'),
      onPressed: () => print('Chart!'),
    );
  }
}
