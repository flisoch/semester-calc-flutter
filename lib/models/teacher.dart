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

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      kpfuLink: json['kpfuLink'] ?? "https://kpfu.ru/student/MMChupin",
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'middleName': middleName,
        'lastName': lastName,
        'kpfuLink': kpfuLink,
      };
}
