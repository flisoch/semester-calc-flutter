import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/credit_type.dart';
import 'package:semester_calc_flutter/models/hours.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/models/teacher.dart';
import 'package:url_launcher/url_launcher.dart';

class SubjectScreen extends StatefulWidget {
  final Subject subject;

  SubjectScreen(this.subject);

  @override
  State<StatefulWidget> createState() {
    return SubjectWidgetState();
  }
}

class SubjectWidgetState extends State<SubjectScreen> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Subject subject = this.widget.subject;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: subject.creditType == CreditType.CREDIT
            ? Colors.lightBlue
            : Colors.green,
        title: Text("${subject.name}"),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Форма контроля'),
              subtitle: subject.creditType == CreditType.EXAM
                  ? Text('Экзамен')
                  : Text('Зачёт'),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 15, right: 33),
              title: Text('Программа дисциплины'),
              subtitle: Text('${subject.syllabusLink}'),
              trailing: Icon(Icons.file_download),
              onTap: () => _launchInBrowser('${subject.syllabusLink}'),
            ),
            ListTile(
              title: Text('Преподаватели'),
              subtitle: sameTeachers(subject)
                  ? _buildTeachers(subject, 1)
                  : _buildTeachers(subject, 2),
            ),
            ListTile(
              title: Text('Нагрузка'),
              subtitle: _buildHours(subject),

            ),

          ],
        ).toList(),
      ),
    );
  }

  sameTeachers(Subject subject) {
    Teacher teacher1 = subject.classes.isNotEmpty
        ? subject.classes[0].teacher
        : Teacher.dummy();
    Teacher teacher2 =
        subject.classes.isNotEmpty ? subject.classes[1].teacher : Teacher();
    return teacher1 == teacher2;
  }

  _buildTeachers(Subject subject, num count) {
    if (count == 1) {
      Teacher teacher = subject.classes[0].teacher;
      return ListTile(
        title:
            Text('${teacher.lastName} ${teacher.name} ${teacher.middleName}'),
        subtitle: Text('Лекции и семинары'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () => _launchInBrowser('${teacher.kpfuLink}'),
      );
    } else {
      Teacher teacher1 = subject.classes.isNotEmpty
          ? subject.classes[0].teacher
          : Teacher.dummy();
      Teacher teacher2 = subject.classes.isNotEmpty
          ? subject.classes[1].teacher
          : Teacher.dummy();
      return Column(children: [
        ListTile(
          title: Text(
              '${teacher1.lastName} ${teacher1.name} ${teacher1.middleName}'),
          subtitle: Text('Лекции'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => _launchInBrowser('${teacher1.kpfuLink}'),
        ),
        ListTile(
          title: Text(
              '${teacher2.lastName} ${teacher2.name} ${teacher2.middleName}'),
          subtitle: Text('Семинары'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => _launchInBrowser('${teacher1.kpfuLink}'),
        )
      ]);
    }
  }

  _buildHours(Subject subject) {
    Hours hours = subject.hours;
    return Column(children: [
      ListTile(
        title: Text('В университете'),
        subtitle: Text('${hours.school} ч'),
      ),
      ListTile(
        title: Text('Самостоятельная'),
        subtitle: Text('${hours.selfStudy} ч'),
      )
    ]);
  }
}
