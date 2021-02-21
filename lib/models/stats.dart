
class Stats extends Object {
  final num subjectsCount;
  final num examsCount;
  final num creditsCount;
  final num classesPerWeek;
  final num classesPerDay;
  final num classesToday;
  final num hoursPerWeek;
  final num selfStudyHoursPerWeek;
  final num weeksUntilExams;

  Stats({
    this.subjectsCount,
    this.examsCount,
    this.creditsCount,
    this.classesPerWeek,
    this.classesPerDay,
    this.classesToday,
    this.hoursPerWeek,
    this.selfStudyHoursPerWeek,
    this.weeksUntilExams,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      subjectsCount: json['subjectsCount'],
      examsCount: json['examsCount'],
      creditsCount: json['creditsCount'],
      classesPerWeek: json['classesPerWeek'],
      classesPerDay: json['classesPerDay'],
      classesToday: json['classesToday'],
      hoursPerWeek: json['hoursPerWeek'].round(),
      selfStudyHoursPerWeek: json['selfStudyHoursPerWeek'].round(),
      weeksUntilExams: json['weeksUntilExam'],
    );
  }
  
  @override
  String toString() {
    return 'Stats: { subjectsCount: ${this.subjectsCount} ...}';
  }

  Map<String, dynamic> toJson() =>
      {
        'subjectsCount': subjectsCount,
        'examsCount': examsCount,
        'creditsCount': creditsCount,
        'classesPerWeek': classesPerWeek,
        'classesPerDay': classesPerDay,
        'classesToday': classesToday,
        'hoursPerWeek': hoursPerWeek,
        'selfStudyHoursPerWeek': selfStudyHoursPerWeek,
        'weeksUntilExams': weeksUntilExams,
      };
}
