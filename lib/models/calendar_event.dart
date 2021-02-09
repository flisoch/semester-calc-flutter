class CalendarEvent extends Object {
  num id;
  String weekDay; //"TUESDAY",
  String startTime; //"2020-09-08T08:30:00",
  String endTime; // "2020-09-08T10:00:00",
  num repeatsNumber;

  CalendarEvent({
    this.id = -1,
    this.weekDay = "",
    this.startTime = "",
    this.endTime = "",
    this.repeatsNumber = -1,
  }); //9,

}
