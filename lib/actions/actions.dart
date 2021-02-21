import 'package:sembast/src/api/v2/database.dart';
import 'package:semester_calc_flutter/models/stats.dart';
import 'package:semester_calc_flutter/models/subject.dart';

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

class LoadSubjectsAction {
  final String groupNumber;

  LoadSubjectsAction(this.groupNumber);

  @override
  String toString() {
    return 'LoadSubjectsAction{groupNUmber: $groupNumber}';
  }
}

class SubjectsNotLoadedAction {}

class SubjectsLoadedAction {
  final List<Subject> subjects;

  SubjectsLoadedAction(this.subjects);

  @override
  String toString() {
    return 'SubjectsLoadedAction{subjects: {IsNull:${subjects == null}}';
  }
}

class WatchSubjectAction {
  final Subject subject;

  WatchSubjectAction(this.subject);

  @override
  String toString() {
    return 'WatchSubjectAction{subjects: {IsNull:${subject == null}}';
  }
}

class ClearElectivesAction {}

class ChooseElectiveAction {
  final num electiveDescriptorId;
  final Subject chosenElective;

  ChooseElectiveAction(this.electiveDescriptorId, this.chosenElective);

  @override
  String toString() {
    return 'ChooseElectivesAction{electiveDescriptor: {IsNull:${electiveDescriptorId == null}}, chosenElective: {inNull: ${chosenElective == null}';
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
    return 'NavigateReplaceAction{routeName: $routeName}';
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

class OpenLocalDbAction {
  final bool localDbOpened;

  OpenLocalDbAction(this.localDbOpened);
}

class LocalDbOpenedAction {
  final Database db;

  LocalDbOpenedAction(this.db);
}
