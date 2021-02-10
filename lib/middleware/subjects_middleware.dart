import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/repository/subjects_repository.dart';

List<Middleware<AppState>> createSubjectsMiddleware(
    SubjectsRepository repository,
    ) {
  return [
    TypedMiddleware<AppState, LoadSubjectsAction>(
      _loadSubjects(repository),
    ),
  ];
}

_loadSubjects(SubjectsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    repository.loadSubjects(action.groupNumber).then((subjects) {
      return store.dispatch(SubjectsLoadedAction(subjects));
    }).catchError((_) => store.dispatch(SubjectsNotLoadedAction()));
  };
}
