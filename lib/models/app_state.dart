import 'package:meta/meta.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/routes.dart';

@immutable
class AppState {
  final bool isLoading;
  final bool isLoadingSubjects;
  final String groupNumber;
  final Stats stats;
  final List<Subject> groupSubjects;
  final List<Subject> electives;
  final List<String> route;

  AppState({
    this.isLoading,
    this.isLoadingSubjects = false,
    this.groupNumber,
    this.electives,
    this.groupSubjects,
    this.stats,
    this.route,
  });

  factory AppState.initial() =>
      AppState(isLoading: false, groupNumber: '', route: [AppRoutes.startPage]);

  // AppState copyWith({
  //   bool isLoading,
  //   String groupNumber,
  //   Stats stats,
  //   List<Subject> electives,
  //   List<Subject> groupSubjects,
  // }) {
  //   return AppState(
  //     isLoading: isLoading ?? this.isLoading,
  //     groupNumber: groupNumber ?? this.groupNumber,
  //     stats: stats ?? this.stats,
  //     electives: electives ?? this.stats,
  //     groupSubjects: groupSubjects ?? this.groupSubjects,
  //   );
  // }
}
