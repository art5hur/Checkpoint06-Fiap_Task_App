import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_group.dart';
import 'package:todo_app/pages/task_group_create/widgets/colors_picker.dart';
import 'package:todo_app/providers/task_group_provider.dart';

class TaskGroupCreatePage extends StatefulWidget {
  const TaskGroupCreatePage({super.key, this.taskGroupForEdit});
  final TaskGroup? taskGroupForEdit;

  @override
  State<TaskGroupCreatePage> createState() => _TaskGroupCreatePageState();
}

class _TaskGroupCreatePageState extends State<TaskGroupCreatePage> {
  final nameController = TextEditingController();
  Color selectedColor = Colors.red;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task Group'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameField(),
                const SizedBox(height: 30),
                Text('Select Color',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 10),
                ColorPicker(
                    selectedColor: selectedColor, onColorSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () async {
          await _submitForm();
        },
        label: const Text('Add Task Group'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: nameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is required';
        }
        // max lenth 25
        if (value.length > 25) {
          return 'Name should be less than 25 characters';
        }
        return null;
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.title),
        labelText: 'Name',
        hintText: 'Enter task group name',
      ),
    );
  }

  Future<void> _submitForm() async {
    if (formKey.currentState!.validate()) {
      final taskGroup = TaskGroup.create(
        name: nameController.text,
        color: selectedColor.value,
      );

      await context.read<TaskGroupProvider>().createTaskGroup(taskGroup);

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}
