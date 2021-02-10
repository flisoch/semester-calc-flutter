import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/credit_type.dart';
import 'package:semester_calc_flutter/models/hours.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/repository/subjects_repository.dart';
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
  final _subjectsRepository = SubjectsRepository();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    //todo: rebuild, electives are subjects with descriptor, group electives with same descriptor
    return FutureBuilder(
        future: loadSubjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _subjects = snapshot.data as List<Subject>;
            List<Subject> electives;
            List<Subject> notElectives;
            Map<num, Subject> groupedElectives = Map();
            electives =
                _subjects.where((element) => element.elective).toList();
            notElectives =
                _subjects.where((element) => !element.elective).toList();
            electives.forEach((element) {
              num descrId = element.electiveDescriptor.id;
              var oldId = groupedElectives.keys.firstWhere((element) =>
              element == descrId, orElse: () {
                groupedElectives.putIfAbsent(descrId, () => element);
              },);
              if (oldId != null) {
                groupedElectives.putIfAbsent(oldId, () => element);
              }
            });
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
          else {
            return CircularProgressIndicator();
          }
        }
    );
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

  Future<List<Subject>> loadSubjects() async {
    return _subjectsRepository.loadSubjects('11-701');
  }
}
