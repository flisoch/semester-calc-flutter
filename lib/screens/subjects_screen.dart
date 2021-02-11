import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/models/credit_type.dart';
import 'package:semester_calc_flutter/models/subject.dart';

class SubjectsScreen extends StatefulWidget {
  final List<Subject> subjects;
  final Map<num, Subject> chosenElectives;

  const SubjectsScreen({Key key, this.subjects, this.chosenElectives})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SubjectsWidgetState(
        subjects: subjects, chosenElectives: chosenElectives);
  }
}

class _SubjectsWidgetState extends State<SubjectsScreen> {
  final List<Subject> subjects;
  final Map<num, Subject> chosenElectives;

  List<num> _selectedElective = [];

  List<bool> _hiddenTiles = [];

  _SubjectsWidgetState({this.subjects, this.chosenElectives});

  @override
  Widget build(BuildContext context) {
    List<Subject> electives = getElectives(subjects);
    List<Subject> notElectives = getNotElectives(subjects);
    Map<num, List<Subject>> groupedElectives = groupElectives(electives);
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
                subtitle: _hiddenTiles[index]
                    ? Column(
                        children: _buildElectives(es, index),
                      )
                    : SizedBox.shrink());
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
                StoreProvider.of<AppState>(context)
                    .dispatch(WatchSubjectAction(subject));
              },
            );
          }
        });
  }

  _buildElectives(List<Subject> es, num index) {
    List<Widget> electives = <Widget>[];
    es.forEach((element) {
      print(chosenElectives.containsKey(element.id));
      var listTile = ListTile(
        title: Text(
          element.name,
          style: TextStyle(
              color: chosenElectives.containsValue(element)
                  ? Colors.black
                  : Colors.black38),
        ),
        trailing: Radio<num>(
          value: element.id,
          groupValue:
          chosenElectives.containsValue(element) ? element.id : -1,
          onChanged: (num value) {
            setState(() {
              // _selectedElective[index] = value;
              StoreProvider.of<AppState>(context).dispatch(
                  ChooseElectiveAction(index, element));
            });
          },
        ),
        onTap: () {
          StoreProvider.of<AppState>(context)
              .dispatch(WatchSubjectAction(element));
        },
      );
      electives.add(listTile);
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
