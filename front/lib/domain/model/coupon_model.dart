import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'coupon_model.freezed.dart';
part 'coupon_model.g.dart';

@freezed
class CouponModel with _$CouponModel {
  const factory CouponModel({
    @Default(0.0) double discount,
  }) = _CouponModel;
  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);
}
