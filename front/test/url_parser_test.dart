import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:front/domain/model/trash_model.dart';

void main() {
  test("Jsonの形を確認", () {
    final TrashModel trashModel = TrashModel(createdAt: DateTime.now());
    print(trashModel.toJson());
    //{trashId: %void%, trashBoxId: %void%, userId: %void%, count: 0, createdAt: 2022-12-14T19:21:05.867197}
    final json = jsonEncode(trashModel.toJson());
    print(json);
    final bytes = utf8.encode(json);
    print(bytes);
    final base64 = base64Encode(bytes);
    print(base64);
  });
}
