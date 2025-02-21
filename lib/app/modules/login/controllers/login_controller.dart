import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/services.dart';
import '../../../widgets/widgets.dart';

class LoginController extends GetxController {
  final authService = Get.find<AuthService>();
  final emailController = TextEditingController();
  final isLoading = false.obs;
  final key = GlobalKey<FormState>();
  final passController = TextEditingController();

  /// Va a la pestaña de registro
  goToRegister() => Get.toNamed(Routes.REGISTER);

  /// Va a recuperar contraseña
  goToForgotPassword() => Get.toNamed(Routes.FORGOT_PASSWORD);

  /// Inicia sesión
  login() async {
    if (key.currentState!.validate()) {
      isLoading.value = true;
      try {
        final response = await authService.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text,
        );
        await _validateLoginResponse(response);
      } catch (e) {
        CustomSnackBars.showErrorSnackBar(
          'Hubo un error intenta de nuevo más tarde',
        );
      }
    }
  }

  /// Valida la respuesta del login
  _validateLoginResponse(response) async {
    if (response != null) {
      isLoading.value = false;
      Get.offAllNamed(Routes.HOME);
    } else {
      isLoading.value = false;
    }
  }
}
