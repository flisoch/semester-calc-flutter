import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/credit_type.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/repository/subjects_repository.dart';
import 'package:semester_calc_flutter/routes.dart';

class SubjectsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubjectsWidgetState();
  }
}

class _SubjectsWidgetState extends State<SubjectsScreen> {
  List<Subject> _subjects;
  final _subjectsRepository = SubjectsRepository();
  Future<List<Subject>> _futureSubjects;
  List<num> _selectedElective = [];
  List<bool> _hiddenTiles = [];
  @override
  void initState() {
    _futureSubjects = loadSubjects();
    super.initState();
  }

  Future<List<Subject>> loadSubjects() async {
    return _subjectsRepository.loadSubjects('11-701');
  }

  @override
  Widget build(BuildContext context) {
    //todo: rebuild, electives are subjects with descriptor, group electives with same descriptor
    return FutureBuilder(
        future: _futureSubjects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _subjects = snapshot.data as List<Subject>;
            List<Subject> electives = getElectives(_subjects);
            List<Subject> notElectives = getNotElectives(_subjects);
            Map<num, List<Subject>> groupedElectives =
                groupElectives(electives);
            num itemsCount = notElectives.length + groupedElectives.length;
            for (int i = 0; i < itemsCount; i++) {
              _hiddenTiles.add(false);
              _selectedElective.add(-1);
            }
            return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: itemsCount,
                itemBuilder: (BuildContext context, num index) {
                  if (index >= notElectives.length) {
                    // build electives
                    num idx = index - notElectives.length;
                    List<Subject> es = groupedElectives[idx + 1];
                    var first = es.elementAt(0);
                    return ListTile(
                      onTap: () {
                        setState(() {
                          _hiddenTiles[index] = !_hiddenTiles[index];
                        });
                      },
                        contentPadding: EdgeInsets.only(left: 5),
                        title: Text('${first.electiveDescriptor.name}'),
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            first.creditType == CreditType.CREDIT
                                ? Icon(
                                    Icons.assistant_photo,
                                    color: Colors.lightBlue,
                                  )
                                : Icon(
                                    Icons.assistant_photo,
                                    color: Colors.green,
                                  ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_drop_down),
                        subtitle: _hiddenTiles[index] ? Column(
                          children: _buildElectives(es, index),
                        ) : SizedBox.shrink());
                  } else {
                    // build not electives
                    Subject subject = notElectives[index];
                    return ListTile(
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
                  }
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  _buildElectives(List<Subject> es, num index) {
    List<Widget> electives = <Widget>[];
    es.forEach((element) {
      electives.add(ListTile(
        title: Text(
          element.name,
          style: TextStyle(
              color: element.id == _selectedElective[index]
                  ? Colors.black
                  : Colors.black38),
        ),
        trailing: Radio<num>(
          value: element.id,
          groupValue: _selectedElective[index],
          onChanged: (num value) {
            setState(() {
              _selectedElective[index] = value;
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

  List<Subject> getElectives(List<Subject> subjects) {
    return subjects.where((element) => element.elective).toList();
  }

  List<Subject> getNotElectives(List<Subject> subjects) {
    return subjects.where((element) => !element.elective).toList();
  }

  Map<num, List<Subject>> groupElectives(List<Subject> electives) {
    Map<num, List<Subject>> groupedElectives = Map();
    electives.forEach((element) {
      num descrId = element.electiveDescriptor.id;
      var oldId = groupedElectives.keys.firstWhere(
        (element) => element == descrId,
        orElse: () {
          groupedElectives[descrId] = List.of([element]);
        },
      );
      if (oldId != null) {
        var s = groupedElectives[oldId];
        s.add(element);
        groupedElectives[oldId] = s;
      }
    });
    return groupedElectives;
  }
}
