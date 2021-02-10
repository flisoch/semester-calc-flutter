
import 'package:semester_calc_flutter/models/subject.dart';

abstract class SubjectsRepository {
  Future<List<Subject>> loadSubjects(String groupNumber);
}
