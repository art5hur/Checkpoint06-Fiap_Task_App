import 'package:flutter/material.dart';

class DeleteTaskGroup extends StatelessWidget {
  const DeleteTaskGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.delete_outline,
          color: Colors.red,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          'Delete Task Group',
          style: TextStyle(
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
