import 'package:semester_calc_flutter/models/calendar_event.dart';
import 'package:semester_calc_flutter/models/class.dart';
import 'package:semester_calc_flutter/models/elective_descriptor.dart';
import 'package:semester_calc_flutter/models/teacher.dart';

import 'credit_type.dart';
import 'hours.dart';

class Subject extends Object {
  final num id;
  final String name;
  final bool elective;
  final List<Subject> electives;
  final ElectiveDescriptor electiveDescriptor;
  final List<Class> classes;
  final CreditType creditType;
  final String syllabusLink;
  final Hours hours;

  Subject({
    this.id,
    this.electiveDescriptor,
    this.name,
    this.hours,
    this.elective = false,
    this.electives = const [],
    this.classes = const [],
    this.creditType = CreditType.CREDIT,
    this.syllabusLink =
        "https://kpfu.ru/itis/obuchenie-v-itis/osnovnye-obrazovatelnye-programmy",
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
    Hours hours = Hours.dummy();
    return Subject(
      id: -1,
      name: "Интернет вещей",
      creditType: CreditType.EXAM,
      classes: classes,
      syllabusLink: "https://kpfu.ru/pdf/portal/oop/179283.pdf",
      hours: hours,
      electiveDescriptor: ElectiveDescriptor(),
    );
  }

  factory Subject.fromJson(Map<String, dynamic> json) {
    var hours = json['hours'];
    var creditType =
        json['creditType'] == 'CREDIT' ? CreditType.CREDIT : CreditType.EXAM;
    var electiveDescriptor = json['descriptor'] == null
        ? ElectiveDescriptor()
        : ElectiveDescriptor.fromJson(json['descriptor']);

    return Subject(
      id: json['id'],
      name: json['name'],
      syllabusLink: json['syllabus'] ??
          "https://kpfu.ru/itis/obuchenie-v-itis/osnovnye-obrazovatelnye-programmy",
      hours: Hours(
          id: hours['id'],
          school: hours['school'],
          selfStudy: hours['selfDependant']),
      creditType: creditType,
      elective: json['elective'],
      electiveDescriptor: electiveDescriptor,
    );
  }
}
