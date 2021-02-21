import 'dart:convert';

import 'package:http/http.dart';
import 'package:sembast/sembast.dart';
import 'package:semester_calc_flutter/models/subject.dart';

import 'database_singleton.dart';

class SubjectsRepository {
  String host = 'http://192.168.1.167:8080';
  final _subjectsStore = intMapStoreFactory.store('subjects');


  Future<List<Subject>> loadSubjects(String groupNumber) async {
    final response = await get('$host/api/subjects?groupNumber=$groupNumber');

    if (response.statusCode == 200) {
      List<Subject> subjects =
          (jsonDecode(utf8.decode(response.bodyBytes)) as List)
              .map((i) => Subject.fromJson(i))
              .toList();
      saveSubjectsOffline(groupNumber, subjects);
      return subjects;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<Subject>> loadSubjectsOffline(String groupNumber) async {
    Database db = await DBManager.instance.database;
    final recordSnapshot = await _subjectsStore.find(db);
    final subjects = recordSnapshot.map((snapshot) => Subject.fromJson(snapshot.value)).toList();
    return subjects;
  }

  Future<List<Subject>> saveSubjectsOffline(String groupNumber, List<Subject> subjects) async {
    Database db = await DBManager.instance.database;
    _subjectsStore.addAll(db, subjects.map((s) => s.toJson()).toList());
  }
}


