import 'package:semester_calc_flutter/models/teacher.dart';

import 'calendar_event.dart';

class Class extends Object {
  Teacher teacher;
  CalendarEvent calendarEvent;

  Class({
    this.teacher,
    this.calendarEvent,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    Teacher teacher = Teacher.fromJson(json['teacher']);
    //todo: change json[teacher] to calendarEvent
    CalendarEvent calendarEvent = CalendarEvent.fromJson(json['teacher']);

    return Class(
      teacher: teacher,
      calendarEvent: calendarEvent,
    );
  }

  Map<String, dynamic> toJson() => {
        'teacher': teacher.toJson(),
      };
}
