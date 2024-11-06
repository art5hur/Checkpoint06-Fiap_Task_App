import 'package:uuid/uuid.dart';

class TaskGroup {
  final String id;
  final String name;
  final int color;

  TaskGroup({
    required this.id,
    required this.name,
    required this.color,
  });

  factory TaskGroup.fromMap(Map<String, dynamic> json) {
    return TaskGroup(
      id: json['id'],
      name: json['name'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  factory TaskGroup.create({
    required String name,
    required int color,
  }) =>
      TaskGroup(
        id: const Uuid().v1(),
        name: name,
        color: color,
      );

  TaskGroup copyWith({
    String? id,
    String? name,
    int? color,
  }) =>
      TaskGroup(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
}

class TaskGroupWithCounts {
  TaskGroup taskGroup;
  final int totalTasks;
  final int completedTasks;

  TaskGroupWithCounts({
    required this.taskGroup,
    required this.totalTasks,
    required this.completedTasks,
  });

  TaskGroupWithCounts copyWith({
    TaskGroup? taskGroup,
    int? totalTasks,
    int? completedTasks,
  }) =>
      TaskGroupWithCounts(
        taskGroup: taskGroup ?? this.taskGroup,
        totalTasks: totalTasks ?? this.totalTasks,
        completedTasks: completedTasks ?? this.completedTasks,
      );
}
