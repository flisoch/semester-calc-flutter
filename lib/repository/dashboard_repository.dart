
import 'dart:convert';

import 'package:semester_calc_flutter/models/stats.dart';
import 'package:http/http.dart';

class DashboardRepository {
  String host = 'http://192.168.1.167:8080';

  Future<Stats> loadStats(String groupNumber) async {

    final response =
        await get('$host/api/semester?groupNumber=$groupNumber');

    Stats stats;
    if (response.statusCode == 200) {
      stats = Stats.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return stats;
    } else {
      throw Exception('Failed to load album');
    }
  }

}