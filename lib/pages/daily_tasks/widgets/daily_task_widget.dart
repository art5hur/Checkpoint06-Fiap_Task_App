import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class DailyTaskWidget extends StatelessWidget {
  const DailyTaskWidget({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {},
        leading: GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
                color: task.isCompleted
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: .8)),
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(task.subtitle));
  }
}
