part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Tasks> alltask;
  // All task initialize
  const TasksState({
    this.alltask = const <Tasks>[], 
  });

  @override
  // Here pass initialized variable to List i.e. alltask
  List<Object> get props => [alltask];

  get allTasks => [];
}

// final class TasksInitial extends TasksState {}
