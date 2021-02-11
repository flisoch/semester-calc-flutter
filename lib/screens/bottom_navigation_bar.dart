import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';

import '../routes.dart';

class MainMenu extends StatefulWidget {
  final Widget screen;
  final int selectedIndex;

  MainMenu({
    @required this.screen,
    @required this.selectedIndex,
  });

  @override
  State<StatefulWidget> createState() {
    return _MainMenuState(
      screen: screen,
      selectedIndex: selectedIndex,
    );
  }
}

class _MainMenuState extends State<MainMenu> {
  final int selectedIndex;
  final Widget screen;

  _MainMenuState({
    @required this.screen,
    @required this.selectedIndex,
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
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
      body: screen,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      String route = getRouteByIndex(index);
      StoreProvider.of<AppState>(context).dispatch(NavigateReplaceAction(route));
    });
  }

  String getRouteByIndex(int index) {
    switch (index) {
      case 0:
        return AppRoutes.dashboard;
      case 1:
        return AppRoutes.charts;
      case 2:
        return AppRoutes.subjects;
      case 3:
        return AppRoutes.settings;
      default:
        return AppRoutes.startPage;
    }
  }
}
