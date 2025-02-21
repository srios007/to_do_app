import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class CustomSnackBars {
  static showSuccessSnackBar(String message) => Get.showSnackbar(
        GetSnackBar(
          title: AppLocalizations.of(Get.context!)!.success,
          message: message,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
        ),
      );
  static showErrorSnackBar(String message) => Get.showSnackbar(
        GetSnackBar(
          title: 'Error',
          message: message,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
}
