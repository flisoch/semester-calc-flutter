import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/routes.dart';
import 'package:semester_calc_flutter/screens/home.dart';
import 'package:semester_calc_flutter/screens/welcome_screen.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Semester load calc',
        theme: new ThemeData(primarySwatch: Colors.green),
        initialRoute: AppRoutes.startPage,
        routes: {
          AppRoutes.startPage: (context) => WelcomeScreen(),
          AppRoutes.home: (context) => HomeScreen(),
        },
      ),
    );
  }
}