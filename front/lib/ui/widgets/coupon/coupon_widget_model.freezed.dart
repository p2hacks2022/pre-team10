// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_widget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponWidgetModel _$CouponWidgetModelFromJson(Map<String, dynamic> json) {
  return _CouponWidgetModel.fromJson(json);
}

/// @nodoc
mixin _$CouponWidgetModel {
  String get shopName => throw _privateConstructorUsedError;
  CouponModel get couponModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponWidgetModelCopyWith<CouponWidgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponWidgetModelCopyWith<$Res> {
  factory $CouponWidgetModelCopyWith(
          CouponWidgetModel value, $Res Function(CouponWidgetModel) then) =
      _$CouponWidgetModelCopyWithImpl<$Res, CouponWidgetModel>;
  @useResult
  $Res call({String shopName, CouponModel couponModel});

  $CouponModelCopyWith<$Res> get couponModel;
}

/// @nodoc
class _$CouponWidgetModelCopyWithImpl<$Res, $Val extends CouponWidgetModel>
    implements $CouponWidgetModelCopyWith<$Res> {
  _$CouponWidgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopName = null,
    Object? couponModel = null,
  }) {
    return _then(_value.copyWith(
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      couponModel: null == couponModel
          ? _value.couponModel
          : couponModel // ignore: cast_nullable_to_non_nullable
              as CouponModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CouponModelCopyWith<$Res> get couponModel {
    return $CouponModelCopyWith<$Res>(_value.couponModel, (value) {
      return _then(_value.copyWith(couponModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CouponWidgetModelCopyWith<$Res>
    implements $CouponWidgetModelCopyWith<$Res> {
  factory _$$_CouponWidgetModelCopyWith(_$_CouponWidgetModel value,
          $Res Function(_$_CouponWidgetModel) then) =
      __$$_CouponWidgetModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String shopName, CouponModel couponModel});

  @override
  $CouponModelCopyWith<$Res> get couponModel;
}

/// @nodoc
class __$$_CouponWidgetModelCopyWithImpl<$Res>
    extends _$CouponWidgetModelCopyWithImpl<$Res, _$_CouponWidgetModel>
    implements _$$_CouponWidgetModelCopyWith<$Res> {
  __$$_CouponWidgetModelCopyWithImpl(
      _$_CouponWidgetModel _value, $Res Function(_$_CouponWidgetModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopName = null,
    Object? couponModel = null,
  }) {
    return _then(_$_CouponWidgetModel(
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      couponModel: null == couponModel
          ? _value.couponModel
          : couponModel // ignore: cast_nullable_to_non_nullable
              as CouponModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CouponWidgetModel
    with DiagnosticableTreeMixin
    implements _CouponWidgetModel {
  const _$_CouponWidgetModel(
      {required this.shopName, required this.couponModel});

  factory _$_CouponWidgetModel.fromJson(Map<String, dynamic> json) =>
      _$$_CouponWidgetModelFromJson(json);

  @override
  final String shopName;
  @override
  final CouponModel couponModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CouponWidgetModel(shopName: $shopName, couponModel: $couponModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CouponWidgetModel'))
      ..add(DiagnosticsProperty('shopName', shopName))
      ..add(DiagnosticsProperty('couponModel', couponModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponWidgetModel &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.couponModel, couponModel) ||
                other.couponModel == couponModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shopName, couponModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponWidgetModelCopyWith<_$_CouponWidgetModel> get copyWith =>
      __$$_CouponWidgetModelCopyWithImpl<_$_CouponWidgetModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponWidgetModelToJson(
      this,
    );
  }
}

abstract class _CouponWidgetModel implements CouponWidgetModel {
  const factory _CouponWidgetModel(
      {required final String shopName,
      required final CouponModel couponModel}) = _$_CouponWidgetModel;

  factory _CouponWidgetModel.fromJson(Map<String, dynamic> json) =
      _$_CouponWidgetModel.fromJson;

  @override
  String get shopName;
  @override
  CouponModel get couponModel;
  @override
  @JsonKey(ignore: true)
  _$$_CouponWidgetModelCopyWith<_$_CouponWidgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}
