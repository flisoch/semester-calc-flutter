import 'package:semester_calc_flutter/models/calendar_event.dart';
import 'package:semester_calc_flutter/models/class.dart';
import 'package:semester_calc_flutter/models/teacher.dart';

import 'credit_type.dart';

class Subject extends Object {
  String name;
  bool elective;
  List<Subject> electives;
  List<Class> classes;
  CreditType creditType;
  String syllabusLink;

  Subject({
    this.name,
    this.elective = false,
    this.electives = const [],
    this.classes = const [],
    this.creditType = CreditType.CREDIT,
    this.syllabusLink = "https://kpfu.ru/itis/obuchenie-v-itis/osnovnye-obrazovatelnye-programmy",
  });

  factory Subject.fullDummy() {
    Teacher teacher = Teacher(
        id: 30,
        lastName: "Чупин",
        name: "М.",
        middleName: "М.",
        kpfuLink: "https://kpfu.ru/student/MMChupin");
    CalendarEvent calendarEvent1 = CalendarEvent(
        weekDay: 'FRIDAY',
        startTime: '2021-02-13T15:40:00',
        endTime: '2021-02-13T17:10:00');
    CalendarEvent calendarEvent2 = CalendarEvent(
        weekDay: 'FRIDAY',
        startTime: '2021-02-13T15:40:00',
        endTime: '2021-02-13T17:10:00');
    Class lecture = Class(teacher: teacher, calendarEvent: calendarEvent1);
    Class seminar = Class(teacher: teacher, calendarEvent: calendarEvent2);
    List<Class> classes = [lecture, seminar];
    return Subject(
        name: "Интернет вещей",
        creditType: CreditType.EXAM,
        classes: classes,
        syllabusLink: "https://kpfu.ru/pdf/portal/oop/179283.pdf");
  }
}
