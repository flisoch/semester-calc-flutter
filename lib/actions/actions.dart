class ClearGroupNumberAction {}

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
