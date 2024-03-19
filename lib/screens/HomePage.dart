import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_bloc/bloc/bloc_exports.dart';

import '../bloc/bloc/tasks_bloc.dart';
import '../models/tasks.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addTasks(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // List<Tasks> tasksList = [
    //   Tasks(title: 'Hello'),
    //   Tasks(title: 'title'),
    //   Tasks(title: 'Pakistan')
    // ];
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Tasks> tasksList = state.alltask;
        return Scaffold(
          appBar: AppBar(
            title: Text("Todo App"),
            actions: [
              IconButton(
                  onPressed: () {
                    _addTasks(context);
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Chip(label: Text("Tasks")),
                ),
                TasksList(tasksList: tasksList),
              ]),
          floatingActionButton: IconButton(
            onPressed: () {
              // Before adding items to list
              _addTasks(context);
              debugPrint("adding items to list");
            },
            icon: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
