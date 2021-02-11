import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/subject.dart';

final electivesReducer = combineReducers<Map<num,Subject>>([
  TypedReducer<Map<num,Subject>, ChooseElectiveAction>(_setChosenElectives),
  TypedReducer<Map<num,Subject>, ClearElectivesAction>(_setNoElectives),
]);


Map<num,Subject> _setChosenElectives(
    Map<num,Subject> electives, ChooseElectiveAction action) {
  var electiveDescriptorId = action.electiveDescriptorId;

  if (electives[electiveDescriptorId] != null) {
    electives.update(electiveDescriptorId, (value) => action.chosenElective);
  }
  else {
    electives[electiveDescriptorId] = action.chosenElective;
  }
  return electives;
}

Map<num,Subject> _setNoElectives(
    Map<num,Subject> subjects, ClearElectivesAction action) {
  return Map();
}
