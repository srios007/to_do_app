import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/models.dart';
import '../../../services/firebase/auth/auth_service.dart';
import '../../../services/firebase/model/user_service.dart';

class HomeController extends GetxController {
  final userService = Get.find<UserService>();
  final authService = Get.find<AuthService>();
  final user = Rxn<UserModel?>();
  final filter = AppLocalizations.of(Get.context!)!.all.obs;
  final tasks = <TaskModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    user.value =
        await userService.getUserById(authService.firebaseUser.value!.uid);
  }
}
