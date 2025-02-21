import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class CustomSnackBars {
  static showSuccessSnackBar(String message) => Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
          message: message,
          snackPosition: SnackPosition.TOP,
          title: AppLocalizations.of(Get.context!)!.success,
        ),
      );
  static showErrorSnackBar(String message) => Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          message: message,
          snackPosition: SnackPosition.TOP,
          title: 'Error',
        ),
      );
}
