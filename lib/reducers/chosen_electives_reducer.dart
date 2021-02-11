import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/elective_descriptor.dart';
import 'package:semester_calc_flutter/models/subject.dart';

final electivesReducer = combineReducers<Map<ElectiveDescriptor,Subject>>([
  TypedReducer<Map<ElectiveDescriptor,Subject>, ChooseElectivesAction>(_setChosenElectives),
  TypedReducer<Map<ElectiveDescriptor,Subject>, ClearElectiveAction>(_setNoElectives),
]);


Map<ElectiveDescriptor,Subject> _setChosenElectives(
    Map<ElectiveDescriptor,Subject> electives, ChooseElectivesAction action) {
  return action.electives;
}

Map<ElectiveDescriptor,Subject> _setNoElectives(
    Map<ElectiveDescriptor,Subject> subjects, ClearElectiveAction action) {
  return null;
}
