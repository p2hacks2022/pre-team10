// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      userId: json['userId'] as String? ?? "%void%",
      trashLogIds: (json['trashLogIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      couponIds: (json['couponIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'trashLogIds': instance.trashLogIds,
      'couponIds': instance.couponIds,
    };
