import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/app.dart';
import 'package:semester_calc_flutter/middleware/local_db_middleware.dart';
import 'package:semester_calc_flutter/middleware/navigation_middleware.dart';
import 'package:semester_calc_flutter/middleware/stats_middleware.dart';
import 'package:semester_calc_flutter/middleware/subjects_middleware.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/reducers/app_reducer.dart';
import 'package:semester_calc_flutter/repository/dashboard_repository.dart';
import 'package:semester_calc_flutter/repository/subjects_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new App(
    store: Store<AppState>(
      appReducer,
      middleware: createNavigationMiddleware()
        ..addAll(createSubjectsMiddleware(SubjectsRepository()))
        ..addAll(createStatsMiddleware(DashboardRepository()))
        ..addAll(createLocalDbMiddleware()),
      initialState: AppState.initial(),
    ),
  ));
}
