import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final String title;
  bool? isDone;
  bool? isDeleted;

  Tasks({required this.title, this.isDeleted, this.isDone}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Tasks copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Tasks(
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? this.isDeleted);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
        title: map['title'] ?? '',
        isDeleted: map['isDeleted'] ?? '',
        isDone: map['isDone'] ?? '');
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, isDone, isDeleted];
}
