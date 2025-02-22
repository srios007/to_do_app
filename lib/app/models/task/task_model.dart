import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'task_model_builder.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  DateTime? createdAt;
  RxBool? isCompleted;
  String? description;
  String? id;
  String? name;
  String? translatedText;
  String? userId;


  TaskModel({
    this.createdAt,
    this.description,
    this.id,
    this.isCompleted,
    this.name,
    this.translatedText,
    this.userId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  static TaskModelBuilder get builder => TaskModelBuilder();
}
