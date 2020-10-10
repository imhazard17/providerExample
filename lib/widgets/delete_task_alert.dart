import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskApp_provider/providers/task.dart';

class DeleteTaskAlert extends StatelessWidget {
  final String id;
  final int pops;
  DeleteTaskAlert({@required this.id, this.pops = 1});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want to delete this task?'),
      actions: [
        FlatButton(
          child: Text('NO'),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
          child: Text('YES'),
          onPressed: () {
            for (int i = 0; i < pops; i++) Navigator.pop(context);
            taskProvider.deleteTask(id);
          },
        ),
      ],
    );
  }
}
