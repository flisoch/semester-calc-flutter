import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/app.dart';
import 'package:semester_calc_flutter/middleware/navigation_middleware.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/reducers/app_reducer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new App(
    store: Store<AppState>(
      appReducer,
      middleware: createNavigationMiddleware(),
      initialState: AppState.initial(),
    ),
  ));
}
