import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskApp_provider/screens/about_dev_screen.dart';
import 'package:taskApp_provider/screens/input_screen.dart';
import 'package:taskApp_provider/screens/preferences_screen.dart';
import 'package:taskApp_provider/providers/task.dart';
import 'package:taskApp_provider/widgets/task_tile.dart';

class MyTasksScreen extends StatefulWidget {
  @override
  _MyTasksScreenState createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    final List<Task> tasks = taskProvider.tasks;

    return Scaffold(
      appBar: AppBar(title: Text('My tasks')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => TaskTile(
            task: tasks[index],
            taskProvider: taskProvider,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, InputScreen.routeName),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Preferences'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, PreferencesScreen.routeName);
              },
            ),
            ListTile(
              title: Text('About Developer'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AboutDeveloperScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
