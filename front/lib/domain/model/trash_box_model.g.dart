// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_box_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrashBoxModel _$$_TrashBoxModelFromJson(Map<String, dynamic> json) =>
    _$_TrashBoxModel(
      trashBoxId: json['trashBoxId'] as String? ?? "%void%",
      boxName: json['boxName'] as String? ?? "%void%",
      location: json['location'] == null
          ? const GeoPoint(0, 0)
          : const GeoPointConverter().fromJson(json['location'] as GeoPoint),
      trashLogIds: (json['trashLogIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TrashBoxModelToJson(_$_TrashBoxModel instance) =>
    <String, dynamic>{
      'trashBoxId': instance.trashBoxId,
      'boxName': instance.boxName,
      'location': const GeoPointConverter().toJson(instance.location),
      'trashLogIds': instance.trashLogIds,
    };
