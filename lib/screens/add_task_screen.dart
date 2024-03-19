import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/tasks_bloc.dart';
import '../models/tasks.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    super.key,
  });

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Add Task",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                  label: Text("Title"), border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      var task = Tasks(title:titleController.text);
                      context.read<TasksBloc>().add(AddTask(tasks: task));
                      Navigator.pop(context);
                      // print
                      debugPrint("task added");
                    },
                    child: Text("Add"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
