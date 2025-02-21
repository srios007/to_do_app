import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/models.dart';
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.name!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 140,
                child: Text(
                  task.description!,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () => controller.deleteTask(task.id!),
            child: const Icon(Icons.delete_outline, color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}
