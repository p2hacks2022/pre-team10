import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:front/domain/model/coupon_model.dart';
part 'coupon_widget_model.freezed.dart';
part 'coupon_widget_model.g.dart';

@freezed
class CouponWidgetModel with _$CouponWidgetModel {
  const factory CouponWidgetModel({
    required String shopName,
    required CouponModel couponModel,
  }) = _CouponWidgetModel;
  factory CouponWidgetModel.fromJson(Map<String, dynamic> json) =>
      _$CouponWidgetModelFromJson(json);
}
