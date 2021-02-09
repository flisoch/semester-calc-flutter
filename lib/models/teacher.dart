class Teacher extends Object {
  num id;
  String name;
  String middleName;
  String lastName;
  String kpfuLink;

  factory Teacher.dummy() => Teacher(
      id: 30,
      lastName: "Чупин",
      name: "М.",
      middleName: "М.",
      kpfuLink: "https://kpfu.ru/student/MMChupin");

  Teacher({
    this.id = -1,
    this.name = "",
    this.middleName = "",
    this.lastName = "",
    this.kpfuLink = "",
  });
}
