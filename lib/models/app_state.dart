import 'package:meta/meta.dart';
import 'package:semester_calc_flutter/models/stats.dart';

@immutable
class AppState {
  final bool isLoading;
  final String groupNumber;
  final Stats stats;

  AppState({
    this.isLoading = false,
    this.groupNumber,
    this.stats,
  });

  factory AppState.initial() =>
      AppState(isLoading: true, groupNumber: '11-701');

  AppState copyWith({
    bool isLoading,
    String groupNumber,
    Stats stats,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      groupNumber: groupNumber ?? this.groupNumber,
      stats: stats ?? this.stats,
    );
  }
}
