import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/screens/settings_screen.dart';
import 'package:semester_calc_flutter/screens/subjects_screen.dart';

import 'charts_screen.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  String groupNumber;
  Function clearElectives;
  Function changeGroup;

  HomeScreen({
    @required this.groupNumber,
    @required this.clearElectives,
    @required this.changeGroup,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState(
        this.groupNumber, this.changeGroup, this.clearElectives);
  }
}

class _HomeWidgetState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String groupNumber;
  Function clearElectives;
  Function changeGroup;

  _HomeWidgetState(String groupNumber, Function changeGroup,
      Function clearElectives) {
    this.groupNumber = groupNumber;
    this.changeGroup = changeGroup;
  }

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
          DashboardScreen(),
          ChartsScreen(),
          SubjectsScreen(),
          SettingsScreen(
            groupNumber: groupNumber,
            electives: List.of([Subject.fullDummy()]),
            clearElectives: () => clearElectives,
            changeGroup: () => changeGroup,
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
