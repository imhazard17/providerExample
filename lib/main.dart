import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskApp_provider/screens/about_dev_screen.dart';
import 'package:taskApp_provider/screens/details_screen.dart';
import 'package:taskApp_provider/screens/input_screen.dart';
import 'package:taskApp_provider/screens/preferences_screen.dart';
import 'package:taskApp_provider/providers/task.dart';
import 'package:taskApp_provider/screens/my_tasks_screen.dart';

main() => runApp(TaskApp());

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task App',
        routes: {
          '/': (context) => MyTasksScreen(),
          DetailsScreen.routeName: (context) => DetailsScreen(),
          InputScreen.routeName: (context) => InputScreen(),
          PreferencesScreen.routeName: (context) => PreferencesScreen(),
          AboutDeveloperScreen.routeName: (context) => AboutDeveloperScreen(),
        },
      ),
    );
  }
}
