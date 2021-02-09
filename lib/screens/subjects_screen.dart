import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/Subject.dart';

class SubjectsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChartsWidgetState();
  }
}

class ChartsWidgetState extends State<SubjectsScreen> {
  List<Subject> _subjects = <Subject>[
    Subject(name: 'Дисциплина по выбору', elective: true, electives: [
      Subject(name: 'Интернет вещей'),
      Subject(name: 'Проектирование человеко-машинных интерфейсов'),
    ]),
    Subject(name: 'Методология научных исследований'),
    Subject(name: 'основы информационного поиска')
  ];

  String _selectedElective = "";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: _subjects.length,
        itemBuilder: (BuildContext context, num index) {
          return _subjects[index].elective
              ? ListTile(
                  title: Text('${_subjects[index].name}'),
                  subtitle: Column(
                    children: _buildElectives(_subjects[index]),
                  ),
                )
              : ListTile(
                  title: Text('${_subjects[index].name}'),
                  // onTap: ,
                );
        });
  }

  _buildElectives(Subject subject) {
    List<Widget> electives = <Widget>[];
    subject.electives.forEach((element) {
      electives.add(
        RadioListTile<String>(
          title: Text('${element.name}'),
          value: element.name,
          groupValue: _selectedElective,
          toggleable: true,

          secondary: OutlineButton(
            child: Text("Посмотреть"),
            onPressed: () {
              print("Say Hello");
            },
          ),
          onChanged: (String value) {
            setState(() {
              _selectedElective = value;
            });
          },
        ),
      );
    });
    return electives;
  }
}
