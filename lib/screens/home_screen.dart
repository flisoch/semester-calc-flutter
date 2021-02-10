import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/subject.dart';
import 'package:semester_calc_flutter/screens/settings_screen.dart';
import 'package:semester_calc_flutter/screens/subjects_screen.dart';

import 'charts_screen.dart';
import 'dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeScreen> {
  int _selectedIndex = 0;

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
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Графики'),
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
            groupNumber: '11-701',
            electives: List.of([Subject.fullDummy()]),
            clearElectives: () => print('clearElectives!'),
            clearGroup: () => print('clearGroup!'),
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
