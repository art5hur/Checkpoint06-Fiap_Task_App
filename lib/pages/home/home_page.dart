import 'package:flutter/material.dart';
import 'package:todo_app/pages/daily_tasks/daily_tasks_page.dart';
import 'package:todo_app/pages/task_group_list/task_group_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const TaskGroupListPage(),
        const DailyTasksPage(),
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Daily Tasks',
          ),
        ],
      ),
    );
  }
}
