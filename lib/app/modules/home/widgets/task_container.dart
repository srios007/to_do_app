import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../../modules.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    super.key,
    required this.task,
    required this.controller,
  });

  final TaskModel task;
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Obx(() => Checkbox(
              activeColor: Colors.blueAccent,
              value: task.isCompleted!.value,
              onChanged: (bool? value) async {
                task.isCompleted!.value = value ?? false;
                controller.updateTask(task);
              })),
          const Spacer(),
          SizedBox(
            width: Get.width - 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  task.description!,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    AppLocalizations.of(context)!.translated_from,
                    style: const TextStyle(
                      color: Palette.mainColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  task.translatedName ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  task.translatedDescription ?? '',
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Text(
                  DateFormat('kk:mm  dd/MM/yyyy').format(task.createdAt!),
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () => controller.deleteTask(task.id!),
            child: const Icon(Icons.delete_outline, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}
