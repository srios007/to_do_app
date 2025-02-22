import 'dart:developer';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../routes/app_pages.dart';
import '../../../services/services.dart';

class HomeController extends GetxController {
  final authService = Get.find<AuthService>();
  final filter = AppLocalizations.of(Get.context!)!.all.obs;
  final isLoading = false.obs;
  final tasks = <TaskModel>[].obs;
  final taskService = Get.put(TaskService());
  final user = Rxn<UserModel?>();
  final userService = Get.find<UserService>();
  final filters = [
    AppLocalizations.of(Get.context!)!.all,
    AppLocalizations.of(Get.context!)!.completed,
    AppLocalizations.of(Get.context!)!.notCompleted,
    AppLocalizations.of(Get.context!)!.latest,
    AppLocalizations.of(Get.context!)!.older,
  ];

  @override
  void onInit() {
    super.onInit();
    getUser();
    listenToTasks();
  }

  /// Trae el usuario que inicia sesión
  Future<void> getUser() async {
    user.value = await userService.getUserById(
      authService.firebaseUser.value!.uid,
    );
  }

  /// Escucha los cambios en las tareas del usuario
  void listenToTasks() {
    isLoading.value = true;
    taskService
        .getTasksByUserId(authService.firebaseUser.value!.uid)
        .listen((taskList) {
      tasks.value = taskList;
      isLoading.value = false;
    });
  }

  /// Filtra las tareas por estado
  List<TaskModel> filterTasks() {
    switch (filter.value) {
      case final value
          when value == AppLocalizations.of(Get.context!)!.completed:
        return tasks.where((task) => task.isCompleted!.value).toList();
      case final value
          when value == AppLocalizations.of(Get.context!)!.notCompleted:
        return tasks.where((task) => !task.isCompleted!.value).toList();
      case final value when value == AppLocalizations.of(Get.context!)!.latest:
        return tasks..sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      case final value when value == AppLocalizations.of(Get.context!)!.older:
        return tasks..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      default:
        return tasks;
    }
  }

  /// Elimina una tarea
  Future<void> deleteTask(String taskId) async {
    log('Task: $taskId');
    await taskService.deleteTask(taskId);
    tasks.removeWhere((task) => task.id == taskId);
  }

  /// Actualiza una tarea
  Future<void> updateTask(TaskModel task) async {
    await taskService.updateTask(task);
    final index = tasks.indexWhere((t) => t.id == task.id);
    tasks[index] = task;
  }

  /// Navega a la pantalla de creación de tareas
  Future<void> goToCreate() async {
    await Get.toNamed(Routes.NEW_TASK);
  }

  /// Actualiza las tareas
  Future<void> refreshTasks() async {
    filter.value = AppLocalizations.of(Get.context!)!.all;
  }
}
