import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/screens/bottom_navigation_bar.dart';
import 'package:semester_calc_flutter/screens/dashboard_screen.dart';

class DashboardStoreConnector extends StatelessWidget {
  const DashboardStoreConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardViewModel>(
        onInit: (store) =>
            store.dispatch(LoadStatsAction(store.state.groupNumber)),
        converter: (Store<AppState> store) => DashboardViewModel.from(store),
        builder: (context, vm) => vm.isLoading
            ? Scaffold(body: Center(child: CircularProgressIndicator()), )
            : MainMenu(
                screen: DashboardScreen(
                  stats: vm.stats,
                ),
                selectedIndex: 0,
              ));
  }
}

class DashboardViewModel {
  final bool isLoading;
  final Stats stats;

  DashboardViewModel({
    @required this.isLoading,
    @required this.stats,
  });

  factory DashboardViewModel.from(Store<AppState> store) {
    return DashboardViewModel(
      isLoading: store.state.isLoading,
      stats: store.state.stats,
    );
  }
}
