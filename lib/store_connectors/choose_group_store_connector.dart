import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/routes.dart';
import 'package:semester_calc_flutter/screens/welcome_screen.dart';

class ChooseGroupConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChooseGroupViewModel>(
      converter: (Store<AppState> store) {

        return ChooseGroupViewModel.from(store);
      },
      builder: (context, vm) => WelcomeScreen(vm.saveGroup),
    );
  }
}

class ChooseGroupViewModel {
  final Function saveGroup;

  ChooseGroupViewModel({@required this.saveGroup,});

  factory ChooseGroupViewModel.from(Store<AppState> store) {
    return ChooseGroupViewModel(
      saveGroup: (BuildContext context, String groupNUmber) {
        store.dispatch(SaveGroupNumberAction(groupNUmber));
        store.dispatch(NavigateReplaceAction(AppRoutes.dashboard));

      },
    );
  }

}

