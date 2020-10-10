import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskApp_provider/widgets/delete_task_alert.dart';
import 'package:taskApp_provider/providers/task.dart';
import 'input_screen.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details';

  String dateTimeFormatter(DateTime dT, {bool showTime = false}) {
    String date = '${dT.day}/${dT.month}/${dT.year}';
    if (showTime) {
      if (dT.minute > 10) {
        return date + ', ${dT.hour}:${dT.minute}';
      } else {
        return date + ', ${dT.hour}:0${dT.minute}';
      }
    }
    return date;
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    final TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    final Task task = taskProvider.tasks.firstWhere(
      (task) => task.id == id,
      orElse: () => Task(
        id: '',
        content: '',
        createdDate: DateTime.now(),
        lastEdited: DateTime.now(),
        isImp: false,
        title: '',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              InputScreen.routeName,
              arguments: task,
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              return showDialog(
                context: context,
                builder: (_) => DeleteTaskAlert(id: id, pops: 2),
              );
            },
          ),
          IconButton(
            icon: task.isImp
                ? Icon(Icons.star, color: Colors.amber)
                : Icon(Icons.star_border),
            onPressed: () => taskProvider.changeImpStatus(id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if (task.content != '')
                Card(
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      task.content,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              SizedBox(height: 10),
              Text('Date created : ' + dateTimeFormatter(task.createdDate)),
              Text('Last edited : ' +
                  dateTimeFormatter(task.lastEdited, showTime: true)),
            ],
          ),
        ),
      ),
    );
  }
}
