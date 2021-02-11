import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/screens/bottom_navigation_bar.dart';
import 'package:semester_calc_flutter/screens/charts_screen.dart';

class ChartsStoreConnector extends StatelessWidget {
  const ChartsStoreConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChartsViewModel>(
        converter: (Store<AppState> store) => ChartsViewModel.from(store),
        builder: (context, vm) => vm.isLoading
            ? Scaffold(body: Center(child: CircularProgressIndicator()), )
            : MainMenu(
          screen: ChartsScreen(
            subjects: vm.subjects,
            stats: vm.stats,
            chosenElectives: vm.chosenElectives,
            isLoading: vm.isLoading,
          ),
          selectedIndex: 1,
        ));
  }
}

class ChartsViewModel {
  final bool isLoading;
  final Stats stats;
  final List<Subject> subjects;
  final Map<num, Subject> chosenElectives;

  ChartsViewModel({
    @required this.isLoading,
    @required this.stats,
    @required this.subjects,
    @required this.chosenElectives,
  });

  factory ChartsViewModel.from(Store<AppState> store) {
    return ChartsViewModel(
      isLoading: store.state.isLoading,
      stats: store.state.stats,
      subjects: store.state.groupSubjects,
      chosenElectives: store.state.electives
    );
  }
}
