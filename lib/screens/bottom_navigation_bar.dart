import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:semester_calc_flutter/actions/actions.dart';
import 'package:semester_calc_flutter/models/app_state.dart';

import '../routes.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final Widget screen;
  final int selectedIndex;

  BottomNavigationBarWidget({
    @required this.screen,
    @required this.selectedIndex,
  });

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationBarWidgetState(
      screen: screen,
      selectedIndex: selectedIndex,
    );
  }
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final int selectedIndex;
  final Widget screen;

  _BottomNavigationBarWidgetState({
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
      StoreProvider.of<AppState>(context).dispatch(NavigatePushAction(route));
    });
  }

  String getRouteByIndex(int index) {
    switch (index) {
      case 0:
        return AppRoutes.dashboard;
      case 1:
        return AppRoutes.graphs;
      case 2:
        return AppRoutes.subjects;
      case 3:
        return AppRoutes.settings;
      default:
        return AppRoutes.startPage;
    }
  }
}
