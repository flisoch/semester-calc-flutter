import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/screens/dashboard_screen.dart';

class DashboardStoreConnector extends StatelessWidget {
  final String groupNumber;

  const DashboardStoreConnector({Key key, this.groupNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DashboardViewModel>(
      onInit: (store) => store.dispatch(LoadStatsAction(groupNumber)),
      converter: (Store<AppState> store) => DashboardViewModel.from(store),
      builder: (context, vm) => vm.isLoading
          ? Center(child: CircularProgressIndicator())
          : DashboardScreen(
        stats:vm.stats,
      ),
    );
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
