import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/subject.dart';

class SubjectScreen extends StatefulWidget {
  Subject subject;

  SubjectScreen(this.subject);

  @override
  State<StatefulWidget> createState() {
    return SubjectWidgetState();
  }
}

class SubjectWidgetState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.widget.subject.name}"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
