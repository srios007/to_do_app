import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
import '../controllers/new_task_controller.dart';

class NewTaskView extends GetView<NewTaskController> {
  const NewTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create task',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    _buildTitleField(),
                    const SizedBox(height: 16.0),
                    _buildDescriptionField(),
                    const SizedBox(height: 16.0),
                    const Spacer(),
                    CustomButton(
                      onPressed: controller.submitForm,
                      buttonText: 'Create task',
                      isLoading: false.obs,
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: controller.titleController,
      decoration: const InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a title';
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: controller.descriptionController,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
    );
  }
}
