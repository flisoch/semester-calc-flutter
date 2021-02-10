import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, StatsLoadedAction>(_setLoaded),
  TypedReducer<bool, StatsNotLoadedAction>(_setLoaded),
  TypedReducer<bool, LoadStatsAction>(_setLoading),
  // TypedReducer<bool, RefreshDevicesScreenAction>(_setLoading),
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}
