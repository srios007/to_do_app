import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
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
                  _buildInputsSection(context),
                  const SizedBox(height: 20),
                  const Spacer(flex: 2),
                  _buildRegisterButton(context),
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
  _buildInputsSection(BuildContext context) {
    return Form(
      key: controller.key,
      child: Column(
        children: [
          NormalInput(
            titleText: AppLocalizations.of(context)!.name,
            hintText: AppLocalizations.of(context)!.name_hint,
            textEditingController: controller.nameController,
          ),
          const SizedBox(height: 25),
          NormalInput(
            titleText: AppLocalizations.of(context)!.lastname,
            hintText: AppLocalizations.of(context)!.lastname_hint,
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
  _buildRegisterButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: controller.isLoading,
        onPressed: controller.registerUser,
        buttonText: AppLocalizations.of(context)!.register_button,
      ),
    );
  }
}
