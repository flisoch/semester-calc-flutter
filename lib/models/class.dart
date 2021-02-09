import 'package:semester_calc_flutter/models/teacher.dart';

import 'calendar_event.dart';

class Class extends Object {
  Teacher teacher;
  CalendarEvent calendarEvent;

  Class({
    this.teacher,
    this.calendarEvent,
  });
}
