import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(AppLocalizations.of(context)!.tasks),
        ),
        actions: [Filters(controller: controller)],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
      drawer: DrawerHome(controller: controller),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SizedBox(
      height: Get.height,
      child: SizedBox(
        height: Get.height - 80,
        child: Visibility(
            child: ListView.builder(
          itemCount: controller.filterTasks().length,
          itemBuilder: (context, index) {
            final task = controller.filterTasks()[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == controller.filterTasks().length - 1 ? 80 : 0,
              ),
              child: TaskContainer(task: task, controller: controller),
            );
          },
        )),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: () => Navigator.pushNamed(context, Routes.NEW_TASK),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
