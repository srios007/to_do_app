import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Regístrate!'),
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  inputsSection(),
                  const SizedBox(height: 20),
                  const Spacer(flex: 2),
                  registerButton(),
                  const SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Campos de texto (correo y contraseña)
  inputsSection() {
    return Form(
      key: controller.key,
      child: Column(
        children: [
          NormalInput(
            titleText: 'Nombre',
            hintText: 'Escribe tu nombre',
            textEditingController: controller.nameController,
          ),
          const SizedBox(height: 25),
          NormalInput(
            titleText: 'Apellido',
            hintText: 'Escribe tu apellido',
            textEditingController: controller.lastnameController,
          ),
          const SizedBox(height: 25),
          EmailInput(textEditingController: controller.emailController),
          const SizedBox(height: 25),
          PasswordInput(textEditingController: controller.passController),
        ],
      ),
    );
  }

  /// Botón que inicia sesión
  registerButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: controller.isLoading,
        onPressed: controller.registerUser,
        buttonText: 'Registrarme',
      ),
    );
  }
}
