import 'package:flutter/material.dart';
import 'package:todo_bloc/bloc/bloc_exports.dart';

import '../models/tasks.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Tasks> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            // debugPrint(tasksList.length.toString());
            return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                onChanged: (value) {
                  context.read<TasksBloc>().add(UpdateTask(tasks: task));
                },
                value: task.isDone,
              ),
              onLongPress: () {
                context.read<TasksBloc>().add(DeleteTask(tasks: task));
              },
            );
          }),
    );
  }
}
