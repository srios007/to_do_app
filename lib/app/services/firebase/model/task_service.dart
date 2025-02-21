import 'package:get/get.dart';
import '../../../models/task/task_model.dart';
import '../../../utils/utils.dart';
import '../firestore_service.dart';

class TaskService extends GetxService {
  final FirestoreService _firestoreService = Get.put(FirestoreService());
  final taskReference = FirestoreReferences.tasks;
  /// Create a new task
  Future<bool> createTask(TaskModel task) async {
    return _firestoreService.createDocument(
      taskReference,
      task.toJson(),
    );
  }

  /// Update a task
  Future<bool> updateTask(TaskModel task) async {
    return _firestoreService.updateDocument(
      taskReference,
      task.id!,
      task.toJson(),
    );
  }

  /// Delete a task
  Future<bool> deleteTask(String id) async {
    return _firestoreService.deleteDocument(taskReference, id);
  }

  /// Get tasks for a specific user
  Future<List<TaskModel>> getTasksByUserId(String userId) async {
    final querySnapshot = await _firestoreService.getCollectionById(
      collectionName: taskReference,
      value: userId,
    );
    return querySnapshot.map((doc) => TaskModel.fromJson(doc)).toList();
  }
}
