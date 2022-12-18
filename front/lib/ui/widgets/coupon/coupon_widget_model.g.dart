// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_widget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CouponWidgetModel _$$_CouponWidgetModelFromJson(Map<String, dynamic> json) =>
    _$_CouponWidgetModel(
      shopName: json['shopName'] as String,
      couponModel:
          CouponModel.fromJson(json['couponModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CouponWidgetModelToJson(
        _$_CouponWidgetModel instance) =>
    <String, dynamic>{
      'shopName': instance.shopName,
      'couponModel': instance.couponModel,
    };
