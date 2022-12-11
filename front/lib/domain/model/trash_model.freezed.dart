// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trash_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrashModel _$TrashModelFromJson(Map<String, dynamic> json) {
  return _TrashModel.fromJson(json);
}

/// @nodoc
mixin _$TrashModel {
  String get trashId => throw _privateConstructorUsedError;
  String get trashBoxId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrashModelCopyWith<TrashModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrashModelCopyWith<$Res> {
  factory $TrashModelCopyWith(
          TrashModel value, $Res Function(TrashModel) then) =
      _$TrashModelCopyWithImpl<$Res, TrashModel>;
  @useResult
  $Res call(
      {String trashId, String trashBoxId, String userId, DateTime createdAt});
}

/// @nodoc
class _$TrashModelCopyWithImpl<$Res, $Val extends TrashModel>
    implements $TrashModelCopyWith<$Res> {
  _$TrashModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trashId = null,
    Object? trashBoxId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      trashId: null == trashId
          ? _value.trashId
          : trashId // ignore: cast_nullable_to_non_nullable
              as String,
      trashBoxId: null == trashBoxId
          ? _value.trashBoxId
          : trashBoxId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrashModelCopyWith<$Res>
    implements $TrashModelCopyWith<$Res> {
  factory _$$_TrashModelCopyWith(
          _$_TrashModel value, $Res Function(_$_TrashModel) then) =
      __$$_TrashModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String trashId, String trashBoxId, String userId, DateTime createdAt});
}

/// @nodoc
class __$$_TrashModelCopyWithImpl<$Res>
    extends _$TrashModelCopyWithImpl<$Res, _$_TrashModel>
    implements _$$_TrashModelCopyWith<$Res> {
  __$$_TrashModelCopyWithImpl(
      _$_TrashModel _value, $Res Function(_$_TrashModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trashId = null,
    Object? trashBoxId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_$_TrashModel(
      trashId: null == trashId
          ? _value.trashId
          : trashId // ignore: cast_nullable_to_non_nullable
              as String,
      trashBoxId: null == trashBoxId
          ? _value.trashBoxId
          : trashBoxId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrashModel with DiagnosticableTreeMixin implements _TrashModel {
  const _$_TrashModel(
      {this.trashId = "%void%",
      this.trashBoxId = "%void%",
      this.userId = "%void%",
      required this.createdAt});

  factory _$_TrashModel.fromJson(Map<String, dynamic> json) =>
      _$$_TrashModelFromJson(json);

  @override
  @JsonKey()
  final String trashId;
  @override
  @JsonKey()
  final String trashBoxId;
  @override
  @JsonKey()
  final String userId;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrashModel(trashId: $trashId, trashBoxId: $trashBoxId, userId: $userId, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrashModel'))
      ..add(DiagnosticsProperty('trashId', trashId))
      ..add(DiagnosticsProperty('trashBoxId', trashBoxId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrashModel &&
            (identical(other.trashId, trashId) || other.trashId == trashId) &&
            (identical(other.trashBoxId, trashBoxId) ||
                other.trashBoxId == trashBoxId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, trashId, trashBoxId, userId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrashModelCopyWith<_$_TrashModel> get copyWith =>
      __$$_TrashModelCopyWithImpl<_$_TrashModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrashModelToJson(
      this,
    );
  }
}

abstract class _TrashModel implements TrashModel {
  const factory _TrashModel(
      {final String trashId,
      final String trashBoxId,
      final String userId,
      required final DateTime createdAt}) = _$_TrashModel;

  factory _TrashModel.fromJson(Map<String, dynamic> json) =
      _$_TrashModel.fromJson;

  @override
  String get trashId;
  @override
  String get trashBoxId;
  @override
  String get userId;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_TrashModelCopyWith<_$_TrashModel> get copyWith =>
      throw _privateConstructorUsedError;
}
