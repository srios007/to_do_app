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
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            // child: Visibility(child: ListView.builder(
            //         itemCount: filteredTasks.length,
            //         itemBuilder: (context, index) {
            //           final task = filteredTasks[index];
            //           return Padding(
            //             padding: EdgeInsets.only(
            //               bottom: index == filteredTasks.length - 1 ? 80 : 0,
            //             ),
            //             child: TaskContainer(
            //               task: task,
            //               onChange: () async => await taskProvider.updateTask(
            //                 task,
            //                 context,
            //               ),
            //               onDelete: () async => await taskProvider.removeTask(
            //                 task,
            //                 context,
            //               ),
            //             ),
            //           );
            //         },
            // )),
          ),
        ],
      ),
    );
  }

  // List<TaskModel> _filterTasks(List<TaskModel> tasks) {
  //   if (controller.filter.value== 'Completed') {
  //     return tasks.where((task) => task.isCompleted!).toList();
  //   } else if (controller.filter.value== 'Not Completed') {
  //     return tasks.where((task) => !task.isCompleted!).toList();
  //   }
  //   return tasks;
  // }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: () => Navigator.pushNamed(context, Routes.NEW_TASK),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
