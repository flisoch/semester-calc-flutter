import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/repository/dashboard_repository.dart';

List<Middleware<AppState>> createStatsMiddleware(
  DashboardRepository repository,
) {
  return [
    TypedMiddleware<AppState, LoadStatsAction>(
      _loadStats(repository),
    ),
    new LoggingMiddleware.printer(formatter: logStateFormatter),
  ];
}
String logStateFormatter<State>(
    AppState state, dynamic action, DateTime timestamp) {
  Stats stats = state.stats;
  bool isLoading = state.isLoading;
  return "{Action: $action, State: {Stats: $stats, IsLoading: $isLoading}, ts: $timestamp}";
}

_loadStats(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    repository.loadStats(action.groupNumber).then((stats) {
      return store.dispatch(StatsLoadedAction(stats));
    }).catchError((_) => store.dispatch(StatsNotLoadedAction()));

  };
}
