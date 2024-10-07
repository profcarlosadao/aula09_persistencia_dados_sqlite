import 'package:get/get.dart';
import '../../datasource/task.datasource.dart';
import '../../domain/task.dart';

class TaskController extends GetxController {
  final Rx<List<Task>?> _tasks = Rx(null);
  final Rx<bool?> _loading = Rx(null);
  late TaskDataSource _dataSource;

  TaskController() {
    _dataSource = TaskDataSource();
    initController();
  }

  List<Task> get tasks => _tasks.value ?? [];

  bool get loading => _loading.value ?? false;

  initController() async {
    await _dataSource.initPreference();
    loadTasks();
  }

  Future<void> saveTask(Task value) async {
    final result = await _dataSource.saveTask(value);
    if (result > 0) {
      loadTasks();
    }
  }

  Future<void> loadTasks() async {
    _loading.value = true;
    final result = await _dataSource.loadTasks();
    _tasks.value = result;
    _loading.value = false;
  }
}
