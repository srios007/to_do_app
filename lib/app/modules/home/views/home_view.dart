import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
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
          child: Text(
            AppLocalizations.of(context)!.tasks,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
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
      child: RefreshIndicator(
        onRefresh: controller.refreshTasks,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Obx(() => Column(
                    children: [
                      const SizedBox(height: 16.0),
                      Visibility(
                        visible: controller.isLoading.value,
                        child: const LoadingWidget(),
                      ),
                      Visibility(
                        visible: controller.tasks.isEmpty &&
                            !controller.isLoading.value,
                        child: Expanded(
                          child: Center(
                            child: Text(AppLocalizations.of(context)!.no_task),
                          ),
                        ),
                      ),
                      ...controller.filterTasks().map(
                            (task) => TaskContainer(
                              task: task,
                              controller: controller,
                            ),
                          ),
                      const SizedBox(height: 110.0),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: controller.goToCreate,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
