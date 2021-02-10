import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/subject.dart';

class SettingsScreen extends StatelessWidget {
  final String groupNumber;
  final List<Subject> electives;
  final Function clearElectives;
  final Function changeGroup;

  SettingsScreen({
    @required this.groupNumber,
    @required this.electives,
    @required this.clearElectives,
    @required this.changeGroup,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(context: context, tiles: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 15, right: 28),
          title: Text('Выбрать группу'),
          subtitle: Text('$groupNumber'),
          trailing: Icon(Icons.subject),
          onTap: () => changeGroup(),
        ),
        ListTile(
          title: Text('Выбранные элективы'),
          subtitle: _buildElectives(electives),
          trailing: IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () => clearElectives(),
          ),
        ),
        ListTile(
          title: Text('Google Calendar'),
          // subtitle: _buildElectives(electives),
          trailing: ElevatedButton(
            child: Text('Подключить'),
            onPressed: () => print('Connect google calendar!'),
          ),
          onTap: () => print('connect google Tile!'),
        )
      ]).toList(),
    );
  }

  _buildElectives(List<Subject> electives) {
    List<Widget> electivesTiles = [];
    electives.forEach((element) {
      Widget tile = ListTile(
        title: Text('${element.electiveDescriptor.name}'),
        subtitle: Text('${element.name}'),

      );
      electivesTiles.add(tile);
    });
    return Column(children: electivesTiles);
  }
}
