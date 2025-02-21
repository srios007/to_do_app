import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';

class HomeController extends GetxController {
  final authService = Get.find<AuthService>();
  final filter = AppLocalizations.of(Get.context!)!.all.obs;
  final isLoading = true.obs;
  final tasks = <TaskModel>[].obs;
  final taskService = Get.put(TaskService());
  final user = Rxn<UserModel?>();
  final userService = Get.find<UserService>();

  @override
  void onInit() {
    super.onInit();
    getUser();
    getTasks();
  }

  /// Trae el usuario que inicia sesión
  Future<void> getUser() async {
    user.value = await userService.getUserById(
      authService.firebaseUser.value!.uid,
    );
  }

  /// Trae las tareas del usuario
  Future<void> getTasks() async {
    tasks.value = await taskService.getTasksByUserId(
      authService.firebaseUser.value!.uid,
    );
    isLoading.value = false;
  }

  /// Filtra las tareas por estado
  List<TaskModel> filterTasks() {
    if (filter.value == AppLocalizations.of(Get.context!)!.completed) {
      return tasks.where((task) => task.isCompleted!).toList();
    } else if (filter.value ==
        AppLocalizations.of(Get.context!)!.notCompleted) {
      return tasks.where((task) => !task.isCompleted!).toList();
    }
    return tasks;
  }

  /// Elimina una tarea
  deleteTask(String taskId) async {
    await taskService.deleteTask(taskId);
    tasks.removeWhere((task) => task.id == taskId);
  }

  /// Actualiza una tarea
  updateTask(TaskModel task) async {
    await taskService.updateTask(task);
    final index = tasks.indexWhere((t) => t.id == task.id);
    tasks[index] = task;
  }
}
