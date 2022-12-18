import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'trash_model.freezed.dart';
part 'trash_model.g.dart';

@freezed
class TrashModel with _$TrashModel {
  const factory TrashModel({
    @Default("%void%") String trashId,
    @Default("%void%") String trashBoxId,
    @Default("%void%") String userId,
    @Default(0) int count,
    required DateTime createdAt,
  }) = _TrashModel;
  factory TrashModel.fromJson(Map<String, dynamic> json) =>
      _$TrashModelFromJson(json);
}
