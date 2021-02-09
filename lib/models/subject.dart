import 'credit_type.dart';

class Subject extends Object {
  String name;
  bool elective;
  List<Subject> electives;
  CreditType creditType;

  Subject({
    this.name,
    this.elective = false,
    this.electives = const [],
    this.creditType = CreditType.CREDIT,
  });

}
