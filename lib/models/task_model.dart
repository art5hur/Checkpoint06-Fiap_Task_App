import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;
  final String subtitle;
  final DateTime date;
  final bool isCompleted;
  final String groupId;

  Task({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.isCompleted,
    required this.groupId,
  });

  factory Task.create({
    required String title,
    String? subtitle,
    DateTime? date,
    bool isCompleted = false,
    required String groupId,
  }) =>
      Task(
        id: const Uuid().v1(),
        title: title,
        subtitle: subtitle ?? '',
        date: date ?? DateTime.now(),
        isCompleted: isCompleted,
        groupId: groupId,
      );

  Task copyWith({
    String? id,
    String? title,
    String? subtitle,
    DateTime? date,
    bool? isCompleted,
    String? groupId,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        date: date ?? this.date,
        isCompleted: isCompleted ?? this.isCompleted,
        groupId: groupId ?? this.groupId,
      );

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      id: data['id'],
      title: data['title'],
      subtitle: data['subtitle'],
      date: DateTime.parse(data['date']),
      isCompleted: data['is_completed'],
      groupId: data['task_group_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'date': DateUtils.dateOnly(date).toIso8601String(),
      'is_completed': isCompleted,
      'task_group_id': groupId,
    };
  }
}
