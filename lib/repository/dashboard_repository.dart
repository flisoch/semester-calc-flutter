import 'dart:convert';

import 'package:http/http.dart';
import 'package:sembast/sembast.dart';
import 'package:semester_calc_flutter/models/stats.dart';

import 'database_singleton.dart';

class DashboardRepository {
  final String host = 'http://192.168.1.167:8080';
  final _statsStore = stringMapStoreFactory.store('stats');

  Future<Stats> loadStats(String groupNumber) async {
    final response = await get('$host/api/semester?groupNumber=$groupNumber');

    Stats stats;
    if (response.statusCode == 200) {
      stats = Stats.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      saveStatsOffline(groupNumber, stats);
      return stats;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Stats> loadStatsOffline(String groupNumber) async {
    Database db = await DBManager.instance.database;
    final recordSnapshot = await _statsStore.record(groupNumber).get(db);
    final stats = Stats.fromJson(recordSnapshot);
    return stats;
  }

  Future<Stats> saveStatsOffline(String groupNumber, Stats stats) async {
    Database db = await DBManager.instance.database;
    _statsStore.record(groupNumber).put(db, stats.toJson(), merge: true);
  }
}
