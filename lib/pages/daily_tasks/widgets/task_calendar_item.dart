import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCalendarItem extends StatelessWidget {
  final DateTime date;
  final bool selected;

  const TaskCalendarItem(
      {super.key, required this.date, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: selected
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainer,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('EEE').format(date),
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            date.day.toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
