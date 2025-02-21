// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      isCompleted: RxBool(json['isCompleted'] as bool),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'userId': instance.userId,
    };
