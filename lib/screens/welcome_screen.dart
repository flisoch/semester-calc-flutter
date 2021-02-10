import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  final Function _saveGroup;

  WelcomeScreen(this._saveGroup);

  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreenWidgetState(_saveGroup);
  }
}

class _WelcomeScreenWidgetState extends State<WelcomeScreen> {
  String dropdownGroupValue = '11-701';
  Function _saveGroup;

  _WelcomeScreenWidgetState(Function _saveGroup) {
    this._saveGroup = _saveGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Мой семестр'),
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
                      value: dropdownGroupValue,
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
                        dropdownGroupValue = groupNumber;
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

                child: new Text('Начать'),
                onPressed: () {
                  return _saveGroup(context, dropdownGroupValue);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
