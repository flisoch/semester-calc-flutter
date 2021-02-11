
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/stats.dart';

final statsReducer = combineReducers<Stats>([
  TypedReducer<Stats, LoadStatsAction>(_loadStats),
  TypedReducer<Stats, StatsLoadedAction>(_setLoadedStats),
  TypedReducer<Stats, StatsNotLoadedAction>(_setNoStats),
]);


Stats _loadStats(
    Stats stats, LoadStatsAction action) {
  return null;

}

Stats _setLoadedStats(
    Stats stats, StatsLoadedAction action) {
  return action.stats;
}

Stats _setNoStats(
    Stats stats, StatsNotLoadedAction action) {
  return null;
}
