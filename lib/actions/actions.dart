class ClearGroupNumberAction {}

class SaveGroupNumberAction {
  final String groupNumber;

 SaveGroupNumberAction(this.groupNumber);

  @override
  String toString() {
    return 'SaveGroupNumberAction{groupNUmber: $groupNumber}';
  }
}