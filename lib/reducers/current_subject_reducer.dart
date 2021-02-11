import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/subject.dart';

final currentSubjectReducer = combineReducers<Subject>([
  TypedReducer<Subject, WatchSubjectAction>(_setCurrentSubject),
]);

Subject _setCurrentSubject(Subject subject, WatchSubjectAction action) {

  return action.subject;
}
