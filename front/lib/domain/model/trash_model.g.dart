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
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_TrashModelToJson(_$_TrashModel instance) =>
    <String, dynamic>{
      'trashId': instance.trashId,
      'trashBoxId': instance.trashBoxId,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
