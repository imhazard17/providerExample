import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskApp_provider/providers/task.dart';

class PreferencesScreen extends StatefulWidget {
  static const routeName = '/prefernces';

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Preferences')),
      body: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Important tasks only'),
              subtitle:
                  Text('Include only those tasks which are marked important'),
              activeColor: Colors.blue,
              value: taskProvider.showImpOnly,
              onChanged: (value) => setState(
                () => taskProvider.changeShowImpOnly(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
