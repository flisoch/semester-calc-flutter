class ElectiveDescriptor extends Object {
  num id;
  String name;

  ElectiveDescriptor({this.id, this.name});

  factory ElectiveDescriptor.fromJson(Map<String, dynamic> json) {
    return ElectiveDescriptor(
      id: json['id'],
      name: json['name'],
    );
  }
}
