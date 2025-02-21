import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../routes/app_pages.dart';
import '../../../services/services.dart';

class RegisterController extends GetxController {
  final authService = Get.find<AuthService>();
  final confPassController = TextEditingController();
  final emailController = TextEditingController();
  final isLoading = false.obs;
  final key = GlobalKey<FormState>();
  final lastnameController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();

  /// Crea el usuario
  _buildUser() {
    return UserModel.builder
        .setEmail(emailController.text)
        .setLastname(lastnameController.text)
        .setName(nameController.text)
        .setCreatedAt(DateTime.now())
        .build();
  }

  /// Registrar en firebase auth
  _signUp() async {
    await authService.registerWithEmailAndPassword(
      user: _buildUser(),
      password: passController.text,
    );
  }

  /// Registra al usuario
  registerUser() async {
    if (key.currentState!.validate()) {
      isLoading.value = true;
      final result = await _signUp();
      isLoading.value = false;
      if (result) {
        Get.offAllNamed(Routes.HOME);
      }
    }
  }
}
