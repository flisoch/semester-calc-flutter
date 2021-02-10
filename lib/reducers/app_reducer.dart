import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/reducers/group_number_reducer.dart';
import 'package:semester_calc_flutter/reducers/loading_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    groupNumber: groupNumberReducer(state.groupNumber, action),
  );
}