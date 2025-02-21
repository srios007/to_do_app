import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../widgets/widgets.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  _buildTitleSection(context),
                  const Spacer(flex: 2),
                  _buildInputsSection(context),
                  const Spacer(flex: 2),
                  _buildLoginButton(context),
                  const SizedBox(height: 10),
                  _buildRegisterLabel(context),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Título de la aplicación
  _buildTitleSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        AppLocalizations.of(context)!.app_title,
        style: const TextStyle(
          color: Palette.mainColor,
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
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
          PasswordInput(
            titleText: AppLocalizations.of(context)!.password,
            hintText: AppLocalizations.of(context)!.password_hint,
            textEditingController: controller.passController,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: controller.goToForgotPassword,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.forgot_password,
                  style: const TextStyle(
                    color: Palette.mainColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Label de regístrate
  _buildRegisterLabel(BuildContext context) {
    return GestureDetector(
      onTap: controller.goToRegister,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.no_account,
            style: const TextStyle(
              color: Palette.mainColor,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.register,
            style: const TextStyle(
              color: Palette.mainColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Botón que inicia sesión
  _buildLoginButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        isLoading: controller.isLoading,
        onPressed: controller.login,
        buttonText: AppLocalizations.of(context)!.login,
      ),
    );
  }
}
