import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';

class NewTaskController extends GetxController {
  final authService = Get.find<AuthService>();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final taskService = Get.put(TaskService());
  final titleController = TextEditingController();

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await _createTask();
      isLoading.value = false;
      Get.back();
    }
  }

  /// Create a task in the realtime database
  Future<void> _createTask() async {
    await taskService.createTask(TaskModel.builder
        .setCreatedAt(DateTime.now())
        .setDescription(descriptionController.text)
        .setName(titleController.text)
        .setIsCompleted(RxBool(false))
        .setUserId(authService.firebaseUser.value!.uid)
        .build());
  }
}
