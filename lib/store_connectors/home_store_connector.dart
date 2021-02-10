import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/routes.dart';
import 'package:semester_calc_flutter/screens/home_screen.dart';
import 'package:semester_calc_flutter/store_connectors/choose_group_store_connector.dart';

class HomeStoreConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeViewModel>(
      converter: (Store<AppState> store) => HomeViewModel.from(store),
      builder: (context, vm) => vm.groupNumber.isEmpty
          ? ChooseGroupConnector()
          : HomeScreen(
              groupNumber: vm.groupNumber,
              changeGroup: vm.changeGroup,
              clearElectives: vm.clearElectives,
            ),
    );
  }
}

class HomeViewModel {
  final String groupNumber;
  final Function clearElectives;
  final Function changeGroup;

  HomeViewModel({
    @required this.groupNumber,
    @required this.clearElectives,
    @required this.changeGroup,
  });

  factory HomeViewModel.from(Store<AppState> store) {
    return HomeViewModel(
      groupNumber: store.state.groupNumber,
      changeGroup: () {
        store.dispatch(ClearGroupNumberAction());
        store.dispatch(NavigateReplaceAction(AppRoutes.startPage));
      },
      clearElectives: () => print('clearing electives!'),
    );
  }
}
