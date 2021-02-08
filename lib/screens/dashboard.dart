import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardWidgetState();
  }
}

class _DashboardWidgetState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Screen'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Charts'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Go back!'),
      )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
