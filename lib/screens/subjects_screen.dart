import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/credit_type.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/routes.dart';

class SubjectsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubjectsWidgetState();
  }
}

class _SubjectsWidgetState extends State<SubjectsScreen> {
  List<Subject> _subjects = <Subject>[
    Subject(
        name: 'Дисциплина по выбору',
        creditType: CreditType.EXAM,
        elective: true,
        electives: [
          Subject.fullDummy(),
          Subject(name: 'Проектирование человеко-машинных интерфейсов', creditType: CreditType.EXAM),
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
          Subject subject = _subjects[index];
          return subject.elective
              ? ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  title: Text('${subject.name}'),
                  leading: subject.creditType == CreditType.CREDIT
                      ? Icon(Icons.assistant_photo, color: Colors.lightBlue,)
                      : Icon(Icons.assistant_photo, color: Colors.green,),
                  subtitle: Column(
                    children: _buildElectives(subject),
                  ),
                )
              : ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  leading: subject.creditType == CreditType.CREDIT
                      ? Icon(Icons.assistant_photo, color: Colors.lightBlue,)
                      : Icon(Icons.assistant_photo, color: Colors.green,),
                  title: Text('${subject.name}'),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.subject,
                        arguments: subject);
                  },
                );
        });
  }

  _buildElectives(Subject subject) {
    List<Widget> electives = <Widget>[];
    subject.electives.forEach((element) {
      electives.add(ListTile(
        title: Text(
          element.name,
          style: TextStyle(
              color: element.name == _selectedElective
                  ? Colors.black
                  : Colors.black38),
        ),
        trailing: Radio(
          value: element.name,
          groupValue: _selectedElective,
          onChanged: (String value) {
            setState(() {
              _selectedElective = value;
            });
          },
        ),
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.subject, arguments: element);
        },
      ));
    });
    return electives;
  }
}
