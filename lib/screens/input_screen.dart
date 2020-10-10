import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskApp_provider/providers/task.dart';

class InputScreen extends StatelessWidget {
  static const routeName = '/input';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Task selectedTask = ModalRoute.of(context).settings.arguments;
    final TaskProvider taskProvider = Provider.of<TaskProvider>(context);

    String inputTitle, inputContent;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTask == null ? 'New task' : 'Edit task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: (value) => value.isEmpty ? 'Enter a title' : null,
                initialValue: selectedTask == null ? null : selectedTask.title,
                onSaved: (newValue) => inputTitle = newValue,
                decoration: InputDecoration(hintText: 'Enter title'),
              ),
              SizedBox(height: 5),
              TextFormField(
                initialValue:
                    selectedTask == null ? null : selectedTask.content,
                onSaved: (newValue) => inputContent = newValue,
                decoration: InputDecoration(hintText: 'Enter content'),
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text(
                  selectedTask == null ? 'Add Task' : 'Update task',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    selectedTask == null
                        ? taskProvider.addTask(
                            title: inputTitle,
                            content: inputContent,
                          )
                        : taskProvider.updateTask(
                            id: selectedTask.id,
                            newTitle: inputTitle,
                            newContent: inputContent,
                          );

                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
