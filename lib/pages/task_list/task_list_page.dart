import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/task_create/task_create_page.dart';
import 'package:todo_app/pages/task_list/widgets/delete_task.dart';
import 'package:todo_app/pages/task_list/widgets/task_widget.dart';
import 'package:todo_app/pages/task_list/widgets/tasks_summary_widget.dart';
import 'package:todo_app/providers/task_group_provider.dart';
import 'package:todo_app/providers/task_provider.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  late final TaskGroupProvider taskGroupProvider;

  @override
  void initState() {
    final taskProvider = context.read<TaskProvider>();
    taskGroupProvider = context.read<TaskGroupProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskProvider.listTasksByGroup(taskGroupProvider.selectedTaskGroup!.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Consumer<TaskProvider>(builder: (context, taskProvider, _) {
        if (taskProvider.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Color(taskGroupProvider.selectedTaskGroup!.color),
            ),
          );
        }

        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TasksSummaryWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Divider(
                color: Colors.grey.shade300,
                height: 1,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: taskProvider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskProvider.tasks[index];
                      return Dismissible(
                        key: Key(task.id),
                        background: const DeleteTask(),
                        onDismissed: (direction) {
                          taskProvider.deleteTask(task.id);
                        },
                        confirmDismiss: (direction) {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Delete Task'),
                                content: const Text(
                                    'Are you sure you want to delete this task?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: TaskWidget(
                          task: task,
                          color:
                              Color(taskGroupProvider.selectedTaskGroup!.color),
                        ),
                      );
                    })),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (BuildContext context) {
              return TaskCreatePage(
                groupId: taskGroupProvider.selectedTaskGroup!.id,
              );
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
