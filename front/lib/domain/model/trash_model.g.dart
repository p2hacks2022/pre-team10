// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrashModel _$$_TrashModelFromJson(Map<String, dynamic> json) =>
    _$_TrashModel(
      trashId: json['trashId'] as String? ?? "%void%",
      trashBoxId: json['trashBoxId'] as String? ?? "%void%",
      userId: json['userId'] as String? ?? "%void%",
      count: json['count'] as int? ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_TrashModelToJson(_$_TrashModel instance) =>
    <String, dynamic>{
      'trashId': instance.trashId,
      'trashBoxId': instance.trashBoxId,
      'userId': instance.userId,
      'count': instance.count,
      'createdAt': instance.createdAt.toIso8601String(),
    };
