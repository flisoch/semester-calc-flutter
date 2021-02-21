import 'package:meta/meta.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/routes.dart';

@immutable
class AppState {
  final bool isLoading;
  final String groupNumber;
  final Stats stats;
  final List<Subject> groupSubjects;
  final Map<num, Subject> electives;
  final List<String> route;
  final Subject currentSubject;
  final bool localDbOpened;

  // final Database db;
  final bool isOffline;

  AppState({
    this.isLoading,
    this.groupNumber,
    this.electives,
    this.groupSubjects,
    this.stats,
    this.route,
    this.currentSubject,
    this.localDbOpened,
    // this.db,
    this.isOffline,
  });

  factory AppState.initial() => AppState(
        isLoading: false,
        groupNumber: '',
        route: [AppRoutes.startPage],
        electives: Map<num, Subject>(),
        localDbOpened: false,
        isOffline: true,
      );

  AppState copyWith({
    bool isLoading,
    String groupNumber,
    Stats stats,
    final Map<num, Subject> electives,
    List<Subject> groupSubjects,
    Subject currentSubject,
    List<String> route,
    bool localDbOpened,
    // Database db,
    bool isOffline,
  }) {
    return AppState(
      route: route ?? this.route,
      isLoading: isLoading ?? this.isLoading,
      groupNumber: groupNumber ?? this.groupNumber,
      stats: stats ?? this.stats,
      electives: electives ?? this.electives,
      groupSubjects: groupSubjects ?? this.groupSubjects,
      currentSubject: currentSubject ?? this.currentSubject,
      localDbOpened: localDbOpened ?? this.localDbOpened,
      // db: db ?? this.db,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}
