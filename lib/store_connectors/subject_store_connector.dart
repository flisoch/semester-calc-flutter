import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:semester_calc_flutter/models/app_state.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/screens/subject_screen.dart';

class SubjectStoreConnector extends StatelessWidget {
  const SubjectStoreConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubjectViewModel>(
      converter: (Store<AppState> store) => SubjectViewModel.from(store),
      builder: (context, vm) =>
          vm.isLoading ? SizedBox.shrink() : SubjectScreen(vm.currentSubject),
    );
  }
}

class SubjectViewModel {
  final bool isLoading;
  final Subject currentSubject;

  SubjectViewModel({
    @required this.isLoading,
    @required this.currentSubject,
  });

  factory SubjectViewModel.from(Store<AppState> store) {
    return SubjectViewModel(
      isLoading: store.state.isLoading,
      currentSubject: store.state.currentSubject,
    );
  }
}
