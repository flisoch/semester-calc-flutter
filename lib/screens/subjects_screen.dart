import 'package:flutter/material.dart';

class SubjectsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartsWidgetState();
  }
}

class ChartsWidgetState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child:  Text('Subjects!'),
      onPressed: () => print('Chart!'),
    );
  }
}
