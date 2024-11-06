import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/models/task_model.dart';

class SupabaseRepository {
  Future<List<TaskGroup>> listTaskGroups() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('task_groups').select();
    return response.map((task) => TaskGroup.fromMap(task)).toList();
  }

  Future<List<TaskGroupWithCounts>> listTaskGroupsWithCounts() async {
    final supabase = Supabase.instance.client;
    final taskGroups = await supabase.from('task_groups').select('''
        id,
        name,
        color,
        tasks (
          id,
          is_completed
        )
      ''');

    final List<TaskGroupWithCounts> taskGroupsWithCounts =
        taskGroups.map((taskGroup) {
      final tasks = taskGroup['tasks'] as List;
      final completedTasks = tasks.where((task) => task['is_completed']).length;
      final totalTasks = tasks.length;
      return TaskGroupWithCounts(
        taskGroup: TaskGroup.fromMap(taskGroup),
        completedTasks: completedTasks,
        totalTasks: totalTasks,
      );
    }).toList();

    return taskGroupsWithCounts;
  }

  Future<List<Task>> listTasksByGroup(String groupId) async {
    final supabase = Supabase.instance.client;
    final response =
        await supabase.from('tasks').select().eq('task_group_id', groupId);
    return response.map((task) => Task.fromMap(task)).toList();
  }

  Future createTask(Task task) async {
    final supabase = Supabase.instance.client;
    await supabase.from('tasks').insert(task.toMap());
  }

  Future deleteTask(String taskId) async {
    final supabase = Supabase.instance.client;
    await supabase.from('tasks').delete().eq('id', taskId);
  }

  Future<void> updateTask(Task updatedTask) async {
    final supabase = Supabase.instance.client;
    await supabase
        .from('tasks')
        .update(updatedTask.toMap()) 
        .eq('id',
            updatedTask.id); 
  }

  Future createTaskGroup(TaskGroup taskGroup) async {
    final supabase = Supabase.instance.client;
    await supabase.from('task_groups').insert(taskGroup.toMap());
  }
  
  Future deleteTaskGroup(String taskGroupId) async {
    final supabase = Supabase.instance.client;
    await supabase.from('task_groups').delete().eq('id', taskGroupId);
  }
}
