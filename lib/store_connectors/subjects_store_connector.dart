import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/screens/bottom_navigation_bar.dart';
import 'package:semester_calc_flutter/screens/subjects_screen.dart';

class SubjectsStoreConnector extends StatelessWidget {
  const SubjectsStoreConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubjectsViewModel>(
      onInit: (store) =>
          store.dispatch(LoadSubjectsAction(store.state.groupNumber)),
      converter: (Store<AppState> store) => SubjectsViewModel.from(store),
      builder: (context, vm) => vm.isLoading
          ? SizedBox.shrink()
      // Scaffold(body: Center(child: CircularProgressIndicator()))
          : MainMenu(
              screen: SubjectsScreen(subjects: vm.subjects, chosenElectives: vm.chosenElectives),
              selectedIndex: 2,
            ),
    );
  }
}

class SubjectsViewModel {
  final bool isLoading;
  final List<Subject> subjects;
  final Map<num, Subject> chosenElectives;

  SubjectsViewModel({
    @required this.isLoading,
    @required this.subjects,
    @required this.chosenElectives,
  });

  factory SubjectsViewModel.from(Store<AppState> store) {
    return SubjectsViewModel(
      isLoading: store.state.isLoading,
      subjects: store.state.groupSubjects,
      chosenElectives: store.state.electives,
    );
  }
}
