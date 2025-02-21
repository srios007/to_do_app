import 'task_model.dart';

class TaskModelBuilder {
  DateTime? _createdAt;
  String? _id;
  String? _name;
  String? _description;
  bool? _isCompleted;

  TaskModelBuilder setCreatedAt(DateTime createdAt) {
    _createdAt = createdAt;
    return this;
  }

  TaskModelBuilder setId(String id) {
    _id = id;
    return this;
  }

  TaskModelBuilder setName(String name) {
    _name = name;
    return this;
  }

  TaskModelBuilder setDescription(String description) {
    _description = description;
    return this;
  }

  TaskModelBuilder setIsCompleted(bool isCompleted) {
    _isCompleted = isCompleted;
    return this;
  }

  TaskModel build() {
    return TaskModel(
      createdAt: _createdAt,
      id: _id,
      name: _name,
      description: _description,
      isCompleted: _isCompleted,
    );
  }
}