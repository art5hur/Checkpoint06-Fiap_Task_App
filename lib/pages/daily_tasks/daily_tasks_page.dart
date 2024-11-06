import 'package:flutter/material.dart';

class DailyTasksPage extends StatefulWidget {
  const DailyTasksPage({super.key});

  @override
  State<DailyTasksPage> createState() => _DailyTasksPageState();
}

class _DailyTasksPageState extends State<DailyTasksPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Tasks'),
        actions: [
          // add a icon to open a caledar to select date
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Divider(
              color: Colors.grey.shade300,
              height: 1,
            ),
          ),
          const Expanded(
              child: Center(
            child: Text('Daily Tasks'),
          ))
        ],
      ),
    );
  }
}
