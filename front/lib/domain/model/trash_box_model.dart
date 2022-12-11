import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'trash_box_model.freezed.dart';
part 'trash_box_model.g.dart';

@freezed
class TrashBoxModel with _$TrashBoxModel {
  const factory TrashBoxModel({
    @Default("%void%") String trashBoxId,
    @Default("%void%") String boxName,
    @GeoPointConverter() @Default(GeoPoint(0, 0)) GeoPoint location,
    @Default([]) List<String> trashLogIds,
  }) = _TrashBoxModel;
  factory TrashBoxModel.fromJson(Map<String, dynamic> json) =>
      _$TrashBoxModelFromJson(json);
}

class GeoPointConverter implements JsonConverter<GeoPoint, GeoPoint> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(GeoPoint geoPoint) {
    return geoPoint;
  }

  @override
  GeoPoint toJson(GeoPoint geoPoint) => geoPoint;
}
