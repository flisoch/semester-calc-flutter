import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/screens/settings_screen.dart';
import 'package:semester_calc_flutter/screens/subjects_screen.dart';
import 'package:semester_calc_flutter/store_connectors/dashboard_store_connector.dart';

import 'charts_screen.dart';

class HomeScreen extends StatefulWidget {
  final String groupNumber;
  final Function clearElectives;
  final Function changeGroup;
  // final Stats stats;

  HomeScreen({
    @required this.groupNumber,
    @required this.clearElectives,
    @required this.changeGroup,
    // @required this.stats,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState(
      groupNumber: groupNumber,
      changeGroup: changeGroup,
      clearElectives: clearElectives,
      // stats: stats,
    );
  }
}

class _HomeWidgetState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String groupNumber;
  Function clearElectives;
  Function changeGroup;
  // Stats stats;

  _HomeWidgetState({
    @required this.groupNumber,
    @required this.clearElectives,
    @required this.changeGroup,
    // @required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мой семестр'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Дашборд'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Графики'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Предметы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Настройки'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DashboardStoreConnector(groupNumber: groupNumber,),
          ChartsScreen(),
          SubjectsScreen(),
          SettingsScreen(
            groupNumber: groupNumber,
            electives: List.of([Subject.fullDummy()]),
            clearElectives: clearElectives,
            changeGroup: changeGroup,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
