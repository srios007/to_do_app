import 'package:json_annotation/json_annotation.dart';
import 'task_model_builder.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  DateTime? createdAt;
  String? id;
  String? name;
  String? description;
  bool? isCompleted;

  TaskModel({
    this.id,
    this.name,
    this.description,
    this.isCompleted,
    this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  static TaskModelBuilder get builder => TaskModelBuilder();
}
