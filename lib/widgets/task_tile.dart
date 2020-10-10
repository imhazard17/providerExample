import 'package:flutter/material.dart';
import 'package:taskApp_provider/screens/details_screen.dart';
import 'package:taskApp_provider/providers/task.dart';

import 'delete_task_alert.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final TaskProvider taskProvider;
  const TaskTile({@required this.task, @required this.taskProvider});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(
          task.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: task.isImp ? Colors.red : Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          task.content,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: task.isImp
              ? Icon(Icons.star, color: Colors.amber)
              : Icon(Icons.star_border),
          onPressed: () => taskProvider.changeImpStatus(task.id),
        ),
        onTap: () => Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: task.id,
        ),
        onLongPress: () => showDialog(
          context: context,
          builder: (_) => DeleteTaskAlert(id: task.id),
        ),
      ),
    );
  }
}
