import 'package:flutter/material.dart';
import 'package:semester_calc_flutter/models/subject.dart';

class SettingsScreen extends StatelessWidget {
  final String groupNumber;
  final List<Subject> electives;
  final Function clearElectives;
  final Function clearGroup;

  SettingsScreen({
    @required this.groupNumber,
    @required this.electives,
    @required this.clearElectives,
    @required this.clearGroup,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(context: context, tiles: [
        ListTile(
          title: Text('Очистить выбор группы'),
          subtitle: Text('$groupNumber'),
          trailing: Icon(Icons.delete_outline),
          onTap: clearGroup,
        ),
        ListTile(
          title: Text('Очистить выбранные элективы'),
          subtitle: _buildElectives(electives),
          trailing: Icon(Icons.delete_outline),
          onTap: clearElectives,
        ),
        ListTile(
          title: Text('Google Calendar'),
          // subtitle: _buildElectives(electives),
          trailing: ElevatedButton(
            child: Text('Подключить'),
            onPressed: () => print('Connect google calendar!'),
          ),
          onTap: clearElectives,
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
