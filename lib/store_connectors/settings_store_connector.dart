import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/screens/bottom_navigation_bar.dart';
import 'package:semester_calc_flutter/screens/settings_screen.dart';

class SettingsStoreConnector extends StatelessWidget {
  const SettingsStoreConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsViewModel>(
        onInit: (store) =>
            store.dispatch(LoadStatsAction(store.state.groupNumber)),
        converter: (Store<AppState> store) => SettingsViewModel.from(store),
        builder: (context, vm) => vm.isLoading
            ? Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : MainMenu(
                screen: SettingsScreen(
                  groupNumber: vm.groupNumber,
                  electives: vm.electives,
                  changeGroup: vm.changeGroup,
                  clearElectives: vm.clearElectives,
                ),
                selectedIndex: 3,
              ));
  }
}

class SettingsViewModel {
  final bool isLoading;
  final String groupNumber;
  final Map electives;
  final Function changeGroup;
  final Function clearElectives;

  SettingsViewModel({
    @required this.isLoading,
    @required this.groupNumber,
    @required this.electives,
    @required this.changeGroup,
    @required this.clearElectives,
  });

  factory SettingsViewModel.from(Store<AppState> store) {
    return SettingsViewModel(
        isLoading: store.state.isLoading,
        groupNumber: store.state.groupNumber,
        electives: store.state.electives,
        changeGroup: () {
          store.dispatch(ClearGroupNumberAction());
        },
        clearElectives: () {
          store.dispatch(ClearElectivesAction());
        });
  }
}
