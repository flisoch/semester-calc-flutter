class Subject extends Object {
  String name;
  bool elective;
  List<Subject> electives;

  Subject({
    this.name,
    this.elective = false,
    this.electives = const [],
  });

}
