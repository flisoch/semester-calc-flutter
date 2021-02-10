import 'dart:convert';

import 'package:http/http.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/repository/subjects_repository.dart';

class SubjectsRepositoryImpl implements SubjectsRepository {
  String host = 'http://192.168.1.167:8080';

  @override
  Future<List<Subject>> loadSubjects(String groupNumber) async {
    final response = await get('$host/api/subjects?groupNumber=$groupNumber');

    if (response.statusCode == 200) {
      List<Subject> subjects =
          (jsonDecode(utf8.decode(response.bodyBytes)) as List)
              .map((i) => Subject.fromJson(i))
              .toList();
      return subjects;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
