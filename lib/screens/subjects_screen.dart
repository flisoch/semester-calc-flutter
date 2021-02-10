import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/credit_type.dart';
import 'package:semester_calc_flutter/models/hours.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/routes.dart';
import 'package:http/http.dart' as http;

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
        hours: Hours.dummy(),
        creditType: CreditType.EXAM,
        elective: true,
        electives: [
          Subject.fullDummy(),
          Subject(
              name: 'Проектирование человеко-машинных интерфейсов',
              creditType: CreditType.EXAM,
              hours: Hours.dummy()),
        ]),
    Subject(name: 'Методология научных исследований', hours: Hours.dummy()),
    Subject(name: 'основы информационного поиска', hours: Hours.dummy())
  ];
  String _selectedElective = "";

  Future<List<Subject>> subjects;

  @override
  void initState() {
    super.initState();
    subjects = fetchSubjects();
  }

  Future<List<Subject>> fetchSubjects() async {
    //todo: take group Number from reduxStore
    final response =
        await http.get('http://192.168.1.167:8080/api/subjects?groupNumber=11-701');
    List<Subject> subjects = [];
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      subjects = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
          .map((i) => Subject.fromJson(i))
          .toList();
      subjects.forEach((element) {
        print(element.name);
      });
      return subjects;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

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
                      ? Icon(
                          Icons.assistant_photo,
                          color: Colors.lightBlue,
                        )
                      : Icon(
                          Icons.assistant_photo,
                          color: Colors.green,
                        ),
                  subtitle: Column(
                    children: _buildElectives(subject),
                  ),
                )
              : ListTile(
                  contentPadding: EdgeInsets.only(left: 5),
                  leading: subject.creditType == CreditType.CREDIT
                      ? Icon(
                          Icons.assistant_photo,
                          color: Colors.lightBlue,
                        )
                      : Icon(
                          Icons.assistant_photo,
                          color: Colors.green,
                        ),
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
