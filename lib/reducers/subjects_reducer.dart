import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/subject.dart';

final subjectsReducer = combineReducers<List<Subject>>([
  // TypedReducer<List<Subject>, LoadSubjectsAction>(_loadSubjects),
  TypedReducer<List<Subject>, SubjectsLoadedAction>(_setLoadedSubjects),
  TypedReducer<List<Subject>, SubjectsNotLoadedAction>(_setNoSubjects),
]);

List<Subject> _loadSubjects(List<Subject> subjects, LoadSubjectsAction action) {
  return subjects;
}

List<Subject> _setLoadedSubjects(
    List<Subject> subjects, SubjectsLoadedAction action) {
  return action.subjects;
}

List<Subject> _setNoSubjects(
    List<Subject> subjects, SubjectsNotLoadedAction action) {
  return null;
}
