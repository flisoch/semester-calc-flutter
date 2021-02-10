import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';

final groupNumberReducer = combineReducers<String>([
  TypedReducer<String, SaveGroupNumberAction>(_setGroupNumber),
  TypedReducer<String, ClearGroupNumberAction>(_setNoGroupNumber),
]);

String _setGroupNumber(String prevGroupNumber, action) {
  return action.groupNumber;
}

String _setNoGroupNumber(String prevGroupNumber, action) {
  print(prevGroupNumber);
  print(action);
  return '';
}
