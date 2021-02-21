import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';

final localDbOpenedReducer = combineReducers<bool>([
  TypedReducer<bool, LocalDbOpenedAction>(_setDbOpened),
  TypedReducer<bool, OpenLocalDbAction>(_setDbClosed),
]);

bool _setDbOpened(bool opened, LocalDbOpenedAction action) {
  return true;
}

bool _setDbClosed(bool opened, OpenLocalDbAction action) {
  return false;
}