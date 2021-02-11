import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/reducers/chosen_electives_reducer.dart';
import 'package:semester_calc_flutter/reducers/group_number_reducer.dart';
import 'package:semester_calc_flutter/reducers/loading_reducer.dart';
import 'package:semester_calc_flutter/reducers/stats_reducer.dart';
import 'package:semester_calc_flutter/reducers/subjects_reducer.dart';

import 'current_subject_reducer.dart';
import 'navigation_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    route: navigationReducer(state.route, action),
    groupNumber: groupNumberReducer(state.groupNumber, action),
    stats: statsReducer(state.stats, action),
    groupSubjects: subjectsReducer(state.groupSubjects, action),
    electives: electivesReducer(state.electives, action),
    currentSubject: currentSubjectReducer(state.currentSubject, action),
    isLoading: loadingReducer(state.isLoading, action),
  );
}