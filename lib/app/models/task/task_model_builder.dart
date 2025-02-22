import 'package:get/get.dart';

import 'task_model.dart';

class TaskModelBuilder {
  DateTime? _createdAt;
  RxBool? _isCompleted;
  String? _description;
  String? _id;
  String? _name;
  String? _translatedText;
  String? _userId;

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

  TaskModelBuilder setIsCompleted(RxBool isCompleted) {
    _isCompleted = RxBool(false);
    _isCompleted!.value = isCompleted.value;
    return this;
  }

  TaskModelBuilder setUserId(String userId) {
    _userId = userId;
    return this;
  }

  TaskModelBuilder setTranslatedText(String translatedText) {
    _translatedText = translatedText;
    return this;
  }

  TaskModel build() {
    return TaskModel(
      createdAt: _createdAt,
      id: _id,
      name: _name,
      description: _description,
      isCompleted: _isCompleted,
      userId: _userId,
      translatedText: _translatedText,
    );
  }
}
