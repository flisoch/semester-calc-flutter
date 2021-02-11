import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/routes.dart';

import '../app.dart';

List<Middleware<AppState>> createNavigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigate),
    TypedMiddleware<AppState, WatchSubjectAction>(_navigateToSubject),
    TypedMiddleware<AppState, ClearGroupNumberAction>(_navigateToStart),
    TypedMiddleware<AppState, ClearElectivesAction>(_navigateToSettings),

  ];
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  next(action); //This need to be after name checks
}

_navigate(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }
  next(action); //This need to be after name checks
}

_navigateToSubject(Store<AppState> store, action, NextDispatcher next) {
  final routeName = AppRoutes.subject;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }
  next(action); //This need to be after name checks
}

_navigateToStart(Store<AppState> store, action, NextDispatcher next) {
  final routeName = AppRoutes.startPage;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  next(action); //This need to be after name checks
}

_navigateToSettings(Store<AppState> store, action, NextDispatcher next) {
  final routeName = AppRoutes.settings;

  navigatorKey.currentState.pushNamed(routeName);

  next(action); //This need to be after name checks
}
