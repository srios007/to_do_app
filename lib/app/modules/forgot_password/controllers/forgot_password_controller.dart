import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../services/services.dart';

class ForgotPasswordController extends GetxController {
  final authService = Get.find<AuthService>();
  final emailController = TextEditingController();
  final isLoading = false.obs;
  final key = GlobalKey<FormState>();

  /// Envía correo de recuperación de contraseña
  Future<void> recoverPassword() async {
    if (key.currentState!.validate()) {
      isLoading.value = true;

      await authService.resetPassword(emailController.text.trim());
      isLoading.value = false;
    }
  }
}
