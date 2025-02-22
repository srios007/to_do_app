import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
import '../controllers/new_task_controller.dart';

class NewTaskView extends GetView<NewTaskController> {
  const NewTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.create_task,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  _buildTitleField(context),
                  const SizedBox(height: 16.0),
                  _buildDescriptionField(context),
                  const SizedBox(height: 16.0),
                  const Spacer(),
                  CustomButton(
                    onPressed: controller.submitForm,
                    buttonText:
                        AppLocalizations.of(context)!.create_task_button,
                    isLoading: controller.isLoading,
                  ),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleField(BuildContext context) {
    return NormalInput(
      textEditingController: controller.titleController,
      titleText: AppLocalizations.of(context)!.title,
    );
  }

  Widget _buildDescriptionField(BuildContext context) {
    return NormalInput(
      textEditingController: controller.descriptionController,
      titleText: AppLocalizations.of(context)!.description,
      maxLines: 6,
    );
  }
}
