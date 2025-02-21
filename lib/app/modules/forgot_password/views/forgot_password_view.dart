import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.recover_password,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  _buildInputsSection(context),
                  const Spacer(flex: 2),
                  _buildRecoverButton(context),
                  const SizedBox(height: 10),
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
          EmailInput(
            titleText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.email_hint,
            textEditingController: controller.emailController,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  /// Botón que inicia sesión
  _buildRecoverButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: controller.isLoading,
        onPressed: controller.recoverPassword,
        buttonText: AppLocalizations.of(context)!.send_recovery_email,
      ),
    );
  }
}
