import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/repository/supabase_repository.dart';

class TaskGroupProvider extends ChangeNotifier {
  final _repo = SupabaseRepository();

  TaskGroup? selectedTaskGroup;

  List<TaskGroupWithCounts> _taskGroupsWithCounts = [];
  List<TaskGroupWithCounts> get taskGroupsWithCounts => _taskGroupsWithCounts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> listTaskGroups() async {
    _isLoading = true;
    notifyListeners();
    try {
      _taskGroupsWithCounts = await _repo.listTaskGroupsWithCounts();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createTaskGroup(TaskGroup taskGroup) async {
    try {
      await _repo.createTaskGroup(taskGroup);
      await listTaskGroups();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteTaskGroup(String groupId) async {
    try {
      await _repo.deleteTaskGroup(groupId);
      _taskGroupsWithCounts.removeWhere(
          (taskGroupWithCounts) => taskGroupWithCounts.taskGroup.id == groupId);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
