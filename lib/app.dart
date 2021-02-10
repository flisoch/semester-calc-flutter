import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/route_aware_widget.dart';
import 'package:semester_calc_flutter/routes.dart';
import 'package:semester_calc_flutter/screens/subject_screen.dart';
import 'package:semester_calc_flutter/store_connectors/choose_group_store_connector.dart';
import 'package:semester_calc_flutter/store_connectors/dashboard_store_connector.dart';
import 'package:semester_calc_flutter/store_connectors/subjects_store_connector.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key key, this.store}) : super(key: key);

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.startPage:
        return MainRoute(ChooseGroupConnector(), settings: settings);
      case AppRoutes.dashboard:
        return MainRoute(DashboardStoreConnector(), settings: settings);
      case AppRoutes.subjects:
        return MainRoute(SubjectsStoreConnector(), settings: settings);
      case AppRoutes.subject:
        return MainRoute(SubjectScreen(settings.arguments));
      // case AppRoutes.settings:
      //   return MainRoute(SettingsScreen(), settings: settings);

      default:
        return MainRoute(DashboardStoreConnector(), settings: settings);
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
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
      ),
    );
  }
}

class MainRoute<T> extends MaterialPageRoute<T> {
  MainRoute(Widget widget, {RouteSettings settings})
      : super(
            builder: (_) => RouteAwareWidget(child: widget),
            settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') {
      return child;
    }
    ;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    // return FadeTransition(opacity: animation, child: child);
    return child;
  }
}
