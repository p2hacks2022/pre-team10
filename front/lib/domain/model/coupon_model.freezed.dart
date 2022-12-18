// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponModel _$CouponModelFromJson(Map<String, dynamic> json) {
  return _CouponModel.fromJson(json);
}

/// @nodoc
mixin _$CouponModel {
  double get discount => throw _privateConstructorUsedError;
  String get couponId => throw _privateConstructorUsedError;
  String get trashBoxId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponModelCopyWith<CouponModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponModelCopyWith<$Res> {
  factory $CouponModelCopyWith(
          CouponModel value, $Res Function(CouponModel) then) =
      _$CouponModelCopyWithImpl<$Res, CouponModel>;
  @useResult
  $Res call({double discount, String couponId, String trashBoxId});
}

/// @nodoc
class _$CouponModelCopyWithImpl<$Res, $Val extends CouponModel>
    implements $CouponModelCopyWith<$Res> {
  _$CouponModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = null,
    Object? couponId = null,
    Object? trashBoxId = null,
  }) {
    return _then(_value.copyWith(
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as String,
      trashBoxId: null == trashBoxId
          ? _value.trashBoxId
          : trashBoxId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CouponModelCopyWith<$Res>
    implements $CouponModelCopyWith<$Res> {
  factory _$$_CouponModelCopyWith(
          _$_CouponModel value, $Res Function(_$_CouponModel) then) =
      __$$_CouponModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double discount, String couponId, String trashBoxId});
}

/// @nodoc
class __$$_CouponModelCopyWithImpl<$Res>
    extends _$CouponModelCopyWithImpl<$Res, _$_CouponModel>
    implements _$$_CouponModelCopyWith<$Res> {
  __$$_CouponModelCopyWithImpl(
      _$_CouponModel _value, $Res Function(_$_CouponModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = null,
    Object? couponId = null,
    Object? trashBoxId = null,
  }) {
    return _then(_$_CouponModel(
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as String,
      trashBoxId: null == trashBoxId
          ? _value.trashBoxId
          : trashBoxId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CouponModel with DiagnosticableTreeMixin implements _CouponModel {
  const _$_CouponModel(
      {this.discount = 10.0, this.couponId = '', this.trashBoxId = ''});

  factory _$_CouponModel.fromJson(Map<String, dynamic> json) =>
      _$$_CouponModelFromJson(json);

  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final String couponId;
  @override
  @JsonKey()
  final String trashBoxId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CouponModel(discount: $discount, couponId: $couponId, trashBoxId: $trashBoxId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CouponModel'))
      ..add(DiagnosticsProperty('discount', discount))
      ..add(DiagnosticsProperty('couponId', couponId))
      ..add(DiagnosticsProperty('trashBoxId', trashBoxId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponModel &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.couponId, couponId) ||
                other.couponId == couponId) &&
            (identical(other.trashBoxId, trashBoxId) ||
                other.trashBoxId == trashBoxId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, discount, couponId, trashBoxId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponModelCopyWith<_$_CouponModel> get copyWith =>
      __$$_CouponModelCopyWithImpl<_$_CouponModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponModelToJson(
      this,
    );
  }
}

abstract class _CouponModel implements CouponModel {
  const factory _CouponModel(
      {final double discount,
      final String couponId,
      final String trashBoxId}) = _$_CouponModel;

  factory _CouponModel.fromJson(Map<String, dynamic> json) =
      _$_CouponModel.fromJson;

  @override
  double get discount;
  @override
  String get couponId;
  @override
  String get trashBoxId;
  @override
  @JsonKey(ignore: true)
  _$$_CouponModelCopyWith<_$_CouponModel> get copyWith =>
      throw _privateConstructorUsedError;
}
