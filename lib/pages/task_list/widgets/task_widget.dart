import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/providers/task_provider.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task, required this.color});
  final Task task;
  final Color color;
  
  get selectedTaskGroup => null;
  


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: GestureDetector(
        onTap: ()  {
          context.read<TaskProvider>().toggleTaskCompletion(task);            
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          decoration: BoxDecoration(
            color: task.isCompleted ? color : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: .8),
          ),
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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.subtitle,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                top: 10,
              ),
              child: Text(
                DateFormat.yMMMEd().format(task.date),
                style: TextStyle(
                  fontSize: 12,
                  color: task.isCompleted ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
