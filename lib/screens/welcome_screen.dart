import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/routes.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreenWidgetState();
  }
}

class _WelcomeScreenWidgetState extends State<WelcomeScreen> {
  String dropdownValue = '11-701';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Semester calc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      items: <String>['11-701', '11-702', '11-703']
                          .map<DropdownMenuItem<String>>(((String group) {
                        return DropdownMenuItem<String>(
                          value: group,
                          child: Center(child: Text(group)),
                        );
                      })).toList(),
                      onChanged: (groupNumber) => setState(() {
                        dropdownValue = groupNumber;
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: new Text('Start'),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.home, (Route<dynamic> route) => false);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
