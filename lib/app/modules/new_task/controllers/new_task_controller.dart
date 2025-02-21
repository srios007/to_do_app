import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';

class NewTaskController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final taskService = Get.put(TaskService());
  final authService = Get.find<AuthService>();

  void submitForm() {
    if (formKey.currentState!.validate()) {
      _createTask();
      Get.back();
    }
  }

  /// Create a task in the realtime database
  Future<void> _createTask() async {
    await taskService.createTask(TaskModel.builder
        .setCreatedAt(DateTime.now())
        .setDescription(descriptionController.text)
        .setName(titleController.text)
        .setIsCompleted(false)
        .setUserId(authService.firebaseUser.value!.uid)
        .build());
  }
}
