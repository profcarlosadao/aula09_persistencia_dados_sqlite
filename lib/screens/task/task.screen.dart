import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/task.dart';
import 'task.controller.dart';
import 'widget/custom_bottom_sheet.widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TaskController _taskController;

  @override
  void initState() {
    _taskController = TaskController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: _taskController.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            final item = _taskController.tasks[index];
            return ListTile(
              title: Text(item.content),
              subtitle: Text("${item.status}"),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return CustomBottomSheet(
                onPressed: (value) {
                  final task = Task(content: value, status: 1);
                  _taskController.saveTask(task);
                },
              );
            },
          );
        },
      ),
    );
  }
}
