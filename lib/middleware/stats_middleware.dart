import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/repository/dashboard_repository.dart';
import 'package:cross_connectivity/cross_connectivity.dart';

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
  String groupNumber = state.groupNumber;
  List<Subject> subjects = state.groupSubjects;
  return "{Action: $action, State: {Stats: $stats, IsLoading: $isLoading,"
      " groupNumber: $groupNumber, subjects: {IsNull: ${subjects == null}}, ts: $timestamp}";
}

_loadStats(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    var statsFuture;
    Connectivity().checkConnection().then((value) {
      if (!value) {
        statsFuture = repository.loadStatsOffline(action.groupNumber);
      } else {
        statsFuture = repository.loadStats(action.groupNumber);
      }
      statsFuture.then((stats) {
        return store.dispatch(StatsLoadedAction(stats));
      }).catchError((_) => store.dispatch(StatsNotLoadedAction()));
    });

  };
}
