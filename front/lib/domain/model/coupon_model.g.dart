// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CouponModel _$$_CouponModelFromJson(Map<String, dynamic> json) =>
    _$_CouponModel(
      discount: (json['discount'] as num?)?.toDouble() ?? 10.0,
      couponId: json['couponId'] as String? ?? '',
      trashBoxId: json['trashBoxId'] as String? ?? '',
    );

Map<String, dynamic> _$$_CouponModelToJson(_$_CouponModel instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'couponId': instance.couponId,
      'trashBoxId': instance.trashBoxId,
    };
