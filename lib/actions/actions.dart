import 'package:semester_calc_flutter/models/stats.dart';

class ClearGroupNumberAction {}

class LoadStatsAction {
  final String groupNumber;

  LoadStatsAction(this.groupNumber);

  @override
  String toString() {
    return 'LoadStatsAction{groupNUmber: $groupNumber}';
  }
}

class StatsNotLoadedAction {}

class StatsLoadedAction {
  final Stats stats;

  StatsLoadedAction(this.stats);

  @override
  String toString() {
    return 'StatsLoadedAction{stats: $stats}';
  }
}

class SaveGroupNumberAction {
  final String groupNumber;

  SaveGroupNumberAction(this.groupNumber);

  @override
  String toString() {
    return 'SaveGroupNumberAction{groupNUmber: $groupNumber}';
  }
}

class NavigateReplaceAction {
  final String routeName;

  NavigateReplaceAction(this.routeName);

  @override
  String toString() {
    return 'MainMenuNavigateAction{routeName: $routeName}';
  }
}

class NavigatePushAction {
  final String routeName;

  NavigatePushAction(this.routeName);

  @override
  String toString() {
    return 'NavigatePushAction{routeName: $routeName}';
  }
}

class NavigatePopAction {
  @override
  String toString() {
    return 'NavigatePopAction';
  }
}
