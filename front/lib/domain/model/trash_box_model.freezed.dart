// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trash_box_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrashBoxModel _$TrashBoxModelFromJson(Map<String, dynamic> json) {
  return _TrashBoxModel.fromJson(json);
}

/// @nodoc
mixin _$TrashBoxModel {
  String get trashBoxId => throw _privateConstructorUsedError;
  String get boxName => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint get location => throw _privateConstructorUsedError;
  List<String> get trashLogIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrashBoxModelCopyWith<TrashBoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrashBoxModelCopyWith<$Res> {
  factory $TrashBoxModelCopyWith(
          TrashBoxModel value, $Res Function(TrashBoxModel) then) =
      _$TrashBoxModelCopyWithImpl<$Res, TrashBoxModel>;
  @useResult
  $Res call(
      {String trashBoxId,
      String boxName,
      @GeoPointConverter() GeoPoint location,
      List<String> trashLogIds});
}

/// @nodoc
class _$TrashBoxModelCopyWithImpl<$Res, $Val extends TrashBoxModel>
    implements $TrashBoxModelCopyWith<$Res> {
  _$TrashBoxModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trashBoxId = null,
    Object? boxName = null,
    Object? location = null,
    Object? trashLogIds = null,
  }) {
    return _then(_value.copyWith(
      trashBoxId: null == trashBoxId
          ? _value.trashBoxId
          : trashBoxId // ignore: cast_nullable_to_non_nullable
              as String,
      boxName: null == boxName
          ? _value.boxName
          : boxName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      trashLogIds: null == trashLogIds
          ? _value.trashLogIds
          : trashLogIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrashBoxModelCopyWith<$Res>
    implements $TrashBoxModelCopyWith<$Res> {
  factory _$$_TrashBoxModelCopyWith(
          _$_TrashBoxModel value, $Res Function(_$_TrashBoxModel) then) =
      __$$_TrashBoxModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String trashBoxId,
      String boxName,
      @GeoPointConverter() GeoPoint location,
      List<String> trashLogIds});
}

/// @nodoc
class __$$_TrashBoxModelCopyWithImpl<$Res>
    extends _$TrashBoxModelCopyWithImpl<$Res, _$_TrashBoxModel>
    implements _$$_TrashBoxModelCopyWith<$Res> {
  __$$_TrashBoxModelCopyWithImpl(
      _$_TrashBoxModel _value, $Res Function(_$_TrashBoxModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trashBoxId = null,
    Object? boxName = null,
    Object? location = null,
    Object? trashLogIds = null,
  }) {
    return _then(_$_TrashBoxModel(
      trashBoxId: null == trashBoxId
          ? _value.trashBoxId
          : trashBoxId // ignore: cast_nullable_to_non_nullable
              as String,
      boxName: null == boxName
          ? _value.boxName
          : boxName // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      trashLogIds: null == trashLogIds
          ? _value._trashLogIds
          : trashLogIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrashBoxModel with DiagnosticableTreeMixin implements _TrashBoxModel {
  const _$_TrashBoxModel(
      {this.trashBoxId = "%void%",
      this.boxName = "%void%",
      @GeoPointConverter() this.location = const GeoPoint(0, 0),
      final List<String> trashLogIds = const []})
      : _trashLogIds = trashLogIds;

  factory _$_TrashBoxModel.fromJson(Map<String, dynamic> json) =>
      _$$_TrashBoxModelFromJson(json);

  @override
  @JsonKey()
  final String trashBoxId;
  @override
  @JsonKey()
  final String boxName;
  @override
  @JsonKey()
  @GeoPointConverter()
  final GeoPoint location;
  final List<String> _trashLogIds;
  @override
  @JsonKey()
  List<String> get trashLogIds {
    if (_trashLogIds is EqualUnmodifiableListView) return _trashLogIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trashLogIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrashBoxModel(trashBoxId: $trashBoxId, boxName: $boxName, location: $location, trashLogIds: $trashLogIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrashBoxModel'))
      ..add(DiagnosticsProperty('trashBoxId', trashBoxId))
      ..add(DiagnosticsProperty('boxName', boxName))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('trashLogIds', trashLogIds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrashBoxModel &&
            (identical(other.trashBoxId, trashBoxId) ||
                other.trashBoxId == trashBoxId) &&
            (identical(other.boxName, boxName) || other.boxName == boxName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._trashLogIds, _trashLogIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, trashBoxId, boxName, location,
      const DeepCollectionEquality().hash(_trashLogIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrashBoxModelCopyWith<_$_TrashBoxModel> get copyWith =>
      __$$_TrashBoxModelCopyWithImpl<_$_TrashBoxModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrashBoxModelToJson(
      this,
    );
  }
}

abstract class _TrashBoxModel implements TrashBoxModel {
  const factory _TrashBoxModel(
      {final String trashBoxId,
      final String boxName,
      @GeoPointConverter() final GeoPoint location,
      final List<String> trashLogIds}) = _$_TrashBoxModel;

  factory _TrashBoxModel.fromJson(Map<String, dynamic> json) =
      _$_TrashBoxModel.fromJson;

  @override
  String get trashBoxId;
  @override
  String get boxName;
  @override
  @GeoPointConverter()
  GeoPoint get location;
  @override
  List<String> get trashLogIds;
  @override
  @JsonKey(ignore: true)
  _$$_TrashBoxModelCopyWith<_$_TrashBoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}
