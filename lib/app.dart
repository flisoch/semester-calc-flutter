import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/route_aware_widget.dart';
import 'package:semester_calc_flutter/routes.dart';
import 'package:semester_calc_flutter/screens/subject_screen.dart';
import 'package:semester_calc_flutter/store_connectors/choose_group_store_connector.dart';
import 'package:semester_calc_flutter/store_connectors/home_store_connector.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key key, this.store}) : super(key: key);

  MaterialPageRoute _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeStoreConnector());
      case AppRoutes.startPage:
        return MaterialPageRoute(builder: (BuildContext context) => ChooseGroupConnector());
      case AppRoutes.subject:
        return MaterialPageRoute(builder: (BuildContext context) => SubjectScreen(ModalRoute.of(context).settings.arguments));

      default:
        return MaterialPageRoute(builder: (BuildContext context) => HomeStoreConnector());
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Semester load calc',
        theme: new ThemeData(primarySwatch: Colors.green),
        initialRoute: AppRoutes.home,
        navigatorKey: navigatorKey,
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) => _getRoute(settings),
        // routes: {
        //   AppRoutes.home: (context) => HomeStoreConnector(),
        //   AppRoutes.startPage: (context) => ChooseGroupConnector(),
        //   AppRoutes.subject: (context) =>
        //       SubjectScreen(ModalRoute.of(context).settings.arguments),
        // },
      ),
    );
  }
}
