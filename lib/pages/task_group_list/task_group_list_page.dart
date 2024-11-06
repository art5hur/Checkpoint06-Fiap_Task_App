import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/pages/task_group_create/task_group_create_page.dart';
import 'package:todo_app/pages/task_group_list/widgets/delete_task_group.dart';
import 'package:todo_app/pages/task_group_list/widgets/task_group_item.dart';
import 'package:todo_app/providers/task_group_provider.dart';
import 'package:todo_app/providers/tema_provider.dart';

class TaskGroupListPage extends StatelessWidget {
  const TaskGroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Groups'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<TemaProvider>(context, listen: false).mudancaTema();
            },
            icon: const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Consumer<TaskGroupProvider>( 
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: provider.taskGroupsWithCounts.length,
            itemBuilder: (context, index) {
              final taskGroupWithCount = provider.taskGroupsWithCounts[index];
              return Dismissible(
                key: Key(taskGroupWithCount.taskGroup.id),
                background: const DeleteTaskGroup(),
                onDismissed: (direction){
                  provider.deleteTask(taskGroupWithCount.taskGroup.id);
                },confirmDismiss: (direction) {
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
                child: TaskGroupItem(taskGroupWithCount: taskGroupWithCount)
                );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const TaskGroupCreatePage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
