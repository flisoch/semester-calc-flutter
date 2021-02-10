import 'package:semester_calc_flutter/models/stats.dart';

abstract class DashboardRepository {
  Future<Stats> loadStats(String groupNumber);
}
