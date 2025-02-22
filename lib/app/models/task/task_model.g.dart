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
      translatedDescription: json['translatedDescription'] as String?,
      translatedName: json['translatedName'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'description': instance.description,
      'id': instance.id,
      'isCompleted': instance.isCompleted!.value,
      'name': instance.name,
      'translatedDescription': instance.translatedDescription,
      'translatedName': instance.translatedName,
      'userId': instance.userId,
    };
