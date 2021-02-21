import 'package:redux/redux.dart';
import 'package:sembast/sembast.dart';
import 'package:semester_calc_flutter/actions/actions.dart';

final localDbReducer = combineReducers<Database>([
  TypedReducer<Database, LocalDbOpenedAction>(_setDb),
]);

Database _setDb(Database db, LocalDbOpenedAction action) {
  return action.db;
}
