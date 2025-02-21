import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class Filters extends StatelessWidget {
  const Filters({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Obx(() => DropdownButton<String>(
            dropdownColor: Colors.blueAccent,
            iconEnabledColor: Colors.white,
            value: controller.filter.value,
            items: controller.filters.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              controller.filter.value = newValue!;
            },
          )),
    );
  }
}
