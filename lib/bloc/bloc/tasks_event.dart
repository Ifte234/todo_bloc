part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Tasks tasks;

  AddTask({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

class UpdateTask extends TasksEvent {
  final Tasks tasks;

  UpdateTask({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

class DeleteTask extends TasksEvent {
  final Tasks tasks;

  DeleteTask({required this.tasks});
  @override
  List<Object> get props => [tasks];
}
