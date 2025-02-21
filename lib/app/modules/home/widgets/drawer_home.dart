import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../services/services.dart';
import '../../../utils/utils.dart';
import '../../modules.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Obx(
              () => Text(
                  '${controller.user.value?.name ?? ''} ${controller.user.value?.lastname ?? ''}',
                  style: const TextStyle(fontWeight: FontWeight.w700)),
            ),
            accountEmail: Obx(() => Text(controller.user.value?.email ?? '')),
            decoration: const BoxDecoration(color: Palette.mainColor),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(AppLocalizations.of(context)!.sign_out),
            onTap: () => Get.find<AuthService>().signOut(),
          ),
        ],
      ),
    );
  }
}
