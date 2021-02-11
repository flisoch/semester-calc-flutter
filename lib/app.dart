import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/routes.dart';
import 'package:semester_calc_flutter/store_connectors/charts_store_connector.dart';
import 'package:semester_calc_flutter/store_connectors/choose_group_store_connector.dart';
import 'package:semester_calc_flutter/store_connectors/dashboard_store_connector.dart';
import 'package:semester_calc_flutter/store_connectors/subject_store_connector.dart';
import 'package:semester_calc_flutter/store_connectors/subjects_store_connector.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key key, this.store}) : super(key: key);

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.startPage:
        return MaterialPageRoute(builder: (context) => ChooseGroupConnector());
      case AppRoutes.dashboard:
        return MaterialPageRoute(
            builder: (context) => DashboardStoreConnector());
      case AppRoutes.subjects:
        return MaterialPageRoute(
            builder: (context) => SubjectsStoreConnector());
      case AppRoutes.subject:
        return MaterialPageRoute(builder: (context) => SubjectStoreConnector());
      case AppRoutes.charts:
        return MaterialPageRoute(builder: (context) => ChartsStoreConnector());
      // case AppRoutes.settings:
      //   return MainRoute(SettingsScreen(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => DashboardStoreConnector(),
            settings: settings);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Semester load calc',
        theme: new ThemeData(primarySwatch: Colors.green),
        initialRoute: AppRoutes.startPage,
        navigatorKey: navigatorKey,
        onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
      ),
    );
  }
}
