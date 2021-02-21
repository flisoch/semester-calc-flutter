class Hours extends Object {
  num id;
  num school;
  num selfStudy;

  factory Hours.dummy() => Hours(id: 300, school: 72, selfStudy: 90);

  Hours({
    this.id,
    this.school,
    this.selfStudy,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'school' : school,
    'selfStudy': selfStudy,
  };

}
